import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_news_toyapp/main.dart';

void main() {
  testWidgets('a very simple widget test', (WidgetTester tester) async {
    // Build the app and trigger a frame
    await tester.pumpWidget(NewsApp());

    // When article tile is not expanded, the launch icon is hidden
    expect(find.byIcon(Icons.launch), findsNothing);

    // After a article tile tap, the launch icon should be visible
    await tester.tap(find.byType(ExpansionTile).first);
    await tester.pump();

    expect(find.byIcon(Icons.launch), findsOneWidget);
  });
}
