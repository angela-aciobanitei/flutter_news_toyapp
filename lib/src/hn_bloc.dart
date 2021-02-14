// BLoC stands for Business Logic Components. The gist of BLoC is that
// everything in the app should be represented as stream of events:
// widgets submit events; other widgets will respond. BLoC sits
// in the middle, managing the conversation.

import 'dart:async';
import 'dart:collection';

import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

import 'article.dart';

class HackerNewsBloc {
  static const _baseUrl = 'https://hacker-news.firebaseio.com/v0/';

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();
  final _isLoadingSubject = BehaviorSubject<bool>();
  final _storiesTypeController = StreamController<StoriesType>();

  var _articles = <Article>[];

  HackerNewsBloc() {
    _initArticles();
    _storiesTypeController.stream.listen((storiesType) async {
      _getArticlesByIds(await _getIds(storiesType));
    });
  }

  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  Stream<bool> get isLoading => _isLoadingSubject.stream;

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  Future<Article> _getArticle(int id) async {
    final storyUrl = '${_baseUrl}item/$id.json';
    final storyResponse = await http.get(storyUrl);
    if (storyResponse.statusCode != 200) {
      throw HackerNewsApiError("Could not fetch article $id.");
    }
    return parseArticle(storyResponse.body);
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

  Future<void> _initArticles() async {
    _getArticlesByIds(await _getIds(StoriesType.topStories));
  }

  _getArticlesByIds(List<int> ids) async {
    _isLoadingSubject.add(true);
    _articles = await Future.wait(ids.map((id) => _getArticle(id)));
    _articlesSubject.add(UnmodifiableListView(_articles));
    _isLoadingSubject.add(false);
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
