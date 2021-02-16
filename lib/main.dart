import 'package:flutter/material.dart';
import 'package:flutter_news_toyapp/src/hn_bloc.dart';

import 'home_page.dart';

void main() {
  final hackerNewsBloc = HackerNewsBloc();
  runApp(NewsApp(bloc: hackerNewsBloc));
}

class NewsApp extends StatelessWidget {
  final HackerNewsBloc bloc;

  NewsApp({Key key, this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          canvasColor: Colors.black,
          // This is to fix the bottom nav label text, if a tab is unselected
          // the black label text was not visible on a black background
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: TextStyle(color: Colors.white54),
              subtitle1: TextStyle(fontFamily: 'Garamond', fontSize: 10.0)),
          fontFamily: 'Garamond'),
      home: HomePage(title: 'Flutter Hacker News', bloc: bloc),
    );
  }
}
