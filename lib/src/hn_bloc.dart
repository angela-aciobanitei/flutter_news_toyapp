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
  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  var _articles = <Article>[];

  List<int> _ids = [
    17392995,
    17397852,
    17395342,
    17385291,
    17387851,
    17395675,
    17387438,
    17393560,
    17391971,
    17392455
  ];

  HackerNewsBloc() {
    _updateArticles().then((_) => _updateArticlesSubject());
  }

  Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  Future<Article> _getArticle(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    final storyResponse = await http.get(storyUrl);
    if (storyResponse.statusCode == 200) {
      return parseArticle(storyResponse.body);
    }
  }

  Future<Null> _updateArticles() async {
    final futureArticles = _ids.map((id) => _getArticle(id));
    _articles = await Future.wait(futureArticles);
  }

  void _updateArticlesSubject() {
    _articlesSubject.add(UnmodifiableListView(_articles));
  }
}
