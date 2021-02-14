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
  static List<int> _newIds = [
    17395675,
    17387438,
    17393560,
    17391971,
    17392455,
  ];

  static List<int> _topIds = [
    17392995,
    17397852,
    17395342,
    17385291,
    17387851,
  ];

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  // ignore: close_sinks
  final _storiesTypeController = StreamController<StoriesType>();

  var _articles = <Article>[];

  HackerNewsBloc() {
    _getArticlesAndUpdate(_topIds);

    _storiesTypeController.stream.listen((storiesType) {
      if (storiesType == StoriesType.newStories) {
        _getArticlesAndUpdate(_newIds);
      } else {
        _getArticlesAndUpdate(_topIds);
      }
    });
  }

  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  Sink<StoriesType> get storiesType => _storiesTypeController.sink;

  Future<Article> _getArticle(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyResponse = await http.get(storyUrl);
    if (storyResponse.statusCode == 200) {
      return parseArticle(storyResponse.body);
    }
  }

  _getArticlesAndUpdate(List<int> ids) {
    _updateArticles(ids).then((_) => _updateArticlesSubject());
  }

  Future<Null> _updateArticles(List<int> articleIds) async {
    final futureArticles = articleIds.map((id) => _getArticle(id));
    _articles = await Future.wait(futureArticles);
  }

  void _updateArticlesSubject() {
    _articlesSubject.add(UnmodifiableListView(_articles));
  }
}

enum StoriesType {
  topStories,
  newStories,
}
