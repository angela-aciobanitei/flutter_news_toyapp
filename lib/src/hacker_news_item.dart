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

  /// The item's unique id (required)
  int get id;

  /// The type of item. One of "job", "story", "comment", "poll", or "pollopt".
  String get type;

  /// Creation date of the item, in Unix Time.
  int get time;

  /// The username of the item's author.
  String get by;

  /// The title of the story, poll or job.
  @nullable
  String get title;

  /// The story, comment, or poll text.
  @nullable
  String get text;

  /// The URL of the story.
  @nullable
  String get url;

  /// The comment's parent: either another comment or the relevant story.
  @nullable
  int get parent;

  /// The ids of the item's comments, in ranked display order.
  BuiltList<int> get kids;

  /// In the case of stories or polls, the total comment count.
  @nullable
  int get descendants;

  /// The story's score, or the votes for a pollopt.
  @nullable
  int get score;

  /// The pollopt's associated poll.
  @nullable
  int get poll;

  /// A list of related pollopts, in display order.
  BuiltList<int> get parts;

  HackerNewsItem._();

  factory HackerNewsItem([updates(HackerNewsItemBuilder b)]) = _$HackerNewsItem;
}

HackerNewsItem parseHackerNewsItem(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  HackerNewsItem item =
      standardSerializers.deserializeWith(HackerNewsItem.serializer, parsed);
  return item;
}
