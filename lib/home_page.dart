import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_news_toyapp/src/article.dart';
import 'package:flutter_news_toyapp/src/hn_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final String title;
  final HackerNewsBloc bloc;

  HomePage({Key key, this.title, this.bloc}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        stream: widget.bloc.articles,
        initialData: UnmodifiableListView<Article>([]),
        builder: (context, snapshot) => ListView(
          children: snapshot.data.map(_buildItem).toList(),
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return ExpansionTile(
      key: Key(article.id.toString()),
      title: Text(article.title ?? '[null]'),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${article.descendants} comments"),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  if (await canLaunch(article.url)) launch(article.url);
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
