import 'dart:convert' as json;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'hacker_news_item.g.dart';

abstract class HackerNewsItem
    implements Built<HackerNewsItem, HackerNewsItemBuilder> {
  static Serializer<HackerNewsItem> get serializer =>
      _$hackerNewsItemSerializer;

  int get id;

  @nullable
  bool get deleted;

  String get type; // "job", "story", "comment", "poll", or "pollopt".
  String get by;

  int get time;

  @nullable
  String get text;

  @nullable
  bool get dead;

  @nullable
  int get parent;

  @nullable
  int get poll;

  BuiltList<int> get kids;

  @nullable
  String get url;

  @nullable
  int get score;

  @nullable
  String get title;

  BuiltList<int> get parts;

  @nullable
  int get descendants;

  HackerNewsItem._();

  factory HackerNewsItem([updates(HackerNewsItemBuilder b)]) = _$HackerNewsItem;
}

HackerNewsItem parseHackerNewsItem(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  HackerNewsItem item =
      standardSerializers.deserializeWith(HackerNewsItem.serializer, parsed);
  return item;
}
