// How to fix Widget Test Error: Not found: 'dart:ui'
// Edit Configurations -> Add new configuration (+) -> Flutter Test
// Make sure that the Test scope is 'All in file' and that
// the Test file points at your test file.
// The Test scope can also be' All in Directory', in which case
// you need to provide the path to your testing directory.

import 'package:flutter/material.dart';
import 'package:flutter_news_toyapp/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('taps on item display url launcher icon',
      (WidgetTester tester) async {
    // Create the widget by telling the tester to build it.
    // https://flutter.dev/docs/cookbook/testing/widget/introduction
    await tester.pumpWidget(NewsApp());

    // Create the Finders
    final iconFinder = find.byIcon(Icons.launch);
    final tileFinder = find.byType(ExpansionTile);
    final keyFinder = find.byKey(Key("Evolution Is the New Deep Learning"));

    // Use matchers provided by flutter_test(`findsNothing`,
    // `findsOneWidget`, `findsNWidgets`)
    expect(iconFinder, findsNothing);

    // Use WidgetTester to tap on the first tile
    await tester.tap(tileFinder.first);
    await tester.pump();

    expect(iconFinder, findsOneWidget);

    await tester.tap(keyFinder);
    await tester.pump();

    expect(iconFinder, findsNWidgets(2));
  }, skip: true);
}
