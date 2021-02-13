// See: https://github.com/HackerNews/API#items

class HackerNewsItem {
  final int id;
  final String type;
  final String title;
  final String text;
  final String url;
  final String by; // The username of the author
  final int time; // Creation date in Unix Time
  final int score;
  final int descendants; // The total comment count
  final List<int> kids; // The ids of items's comments

  const HackerNewsItem(
      {this.id,
      this.type,
      this.title,
      this.text,
      this.url,
      this.by,
      this.time,
      this.score,
      this.descendants,
      this.kids});

  factory HackerNewsItem.fromJson(json) {
    if (json == null) return null;

    return HackerNewsItem(
      id: json["id"] ?? 0,
      type: json["type"] ?? null,
      title: json["title"] ?? null,
      text: json["text"] ?? null,
      url: json["url"] ?? null,
      by: json["by"] ?? null,
      time: json["time"] ?? 0,
      score: json["score"] ?? 0,
      descendants: json["descendants"] ?? 0,
      kids: List<int>.from(json["kids"]) ?? List.empty(),
    );
  }
}
