import 'dart:convert' as convert;

List<int> parseTopStories(String jsonStr) {
  final parsed = convert.jsonDecode(jsonStr);
  return List<int>.from(parsed);
}
