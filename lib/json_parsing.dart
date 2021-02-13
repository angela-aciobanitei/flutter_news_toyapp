import 'dart:convert' as convert;

import 'package:flutter_news_toyapp/src/article.dart';

List<int> parseTopStories(String jsonStr) {
  final parsed = convert.jsonDecode(jsonStr);
  return List<int>.from(parsed);
}

Article parseArticle(String jsonStr) {
  final parsed = convert.jsonDecode(jsonStr);
  return Article.fromJson(parsed);
}
