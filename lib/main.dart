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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(title: 'Home Page', bloc: bloc),
    );
  }
}
