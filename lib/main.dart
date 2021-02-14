import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(visualDensity: VisualDensity.adaptivePlatformDensity),
      home: HomePage(title: 'Home Page'),
    );
  }
}
