import 'dart:convert' as convert;

import 'package:flutter_news_toyapp/src/hacker_news_item.dart';

List<int> parseTopStories(String jsonStr) {
  final parsed = convert.jsonDecode(jsonStr);
  return List<int>.from(parsed);
}

HackerNewsItem parseStory(String jsonStr) {
  final parsed = convert.jsonDecode(jsonStr);
  return HackerNewsItem.fromJson(parsed);
}
