// BLoC stands for Business Logic Components. The gist of BLoC is that
// everything in the app should be represented as stream of events:
// widgets submit events; other widgets will respond. BLoC sits
// in the middle, managing the conversation.

import 'dart:async';
import 'dart:collection';
import 'dart:developer' as dev;

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import 'article.dart';

class HackerNewsBloc {
  static const _baseUrl = 'https://hacker-news.firebaseio.com/v0/';

  var _articles = <Article>[];
  HashMap<int, Article> _cachedArticles;

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  final _isLoadingSubject = BehaviorSubject<bool>();
  // TODO: Fix warning where to close this sink
  final _storiesTypeController = StreamController<StoriesType>();

  HackerNewsBloc() {
    _cachedArticles = HashMap<int, Article>();
    _getArticlesByStoryType(StoriesType.topStories);
    _storiesTypeController.stream.listen((storiesType) async {
      _getArticlesByStoryType(storiesType);
    });
  }

  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  Future<void> _getArticlesByStoryType(StoriesType storiesType) async {
    try {
      final ids = await _getIds(storiesType);
      final articles = _getArticlesByIds(ids);
      return articles;
    } catch (err) {
      dev.log("$err");
    }
  }

  Future<List<int>> _getIds(StoriesType type) async {
    final partUrl = type == StoriesType.topStories ? 'top' : 'new';
    final url = '$_baseUrl${partUrl}stories.json';
    final response = await http.get(url);
    if (response.statusCode != 200) {
      throw HackerNewsApiError("Stories $type couldn't be fetched.");
    }
    return parseTopStories(response.body).take(20).toList();
  }

  _getArticlesByIds(List<int> ids) async {
    _isLoadingSubject.add(true);
    _articles = await Future.wait(ids.map((id) => _getArticle(id)));
    _articlesSubject.add(UnmodifiableListView(_articles));
    _isLoadingSubject.add(false);
  }

  // TODO: Fix Unhandled Exception - where to catch this error?
  Future<Article> _getArticle(int id) async {
    if (!_cachedArticles.containsKey(id)) {
      final storyUrl = '${_baseUrl}item/$id.json';
      final storyResponse = await http.get(storyUrl);
      if (storyResponse.statusCode != 200) {
        throw HackerNewsApiError("Could not fetch article $id.");
      } else {
        _cachedArticles[id] = parseArticle(storyResponse.body);
      }
    }
    return _cachedArticles[id];
  }
}

enum StoriesType {
  topStories,
  newStories,
}

class HackerNewsApiError extends Error {
  final String message;

  HackerNewsApiError(this.message);
}
