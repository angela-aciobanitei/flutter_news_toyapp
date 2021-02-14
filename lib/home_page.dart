import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_news_toyapp/src/hacker_news_item.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<int> _ids = [
    17392995,
    17397852,
    17395342,
    17385291,
    17387851,
    17395675,
    17387438,
    17393560,
    17391971,
    17392455,
  ];

  Future<HackerNewsItem> _getNewsItem(int id) async {
    final storyUrl = 'https://hacker-news.firebaseio.com/v0/item/$id.json';
    try {
      final storyRes = await http.get(storyUrl);
      return parseHackerNewsItem(storyRes.body);
    } catch (err) {
      print('Caught error: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: _ids
            .map((i) => FutureBuilder<HackerNewsItem>(
                  future: _getNewsItem(i),
                  builder: (BuildContext context,
                      AsyncSnapshot<HackerNewsItem> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return _buildItem(snapshot.data);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ))
            .toList(),
      ),
    );
  }

  Widget _buildItem(HackerNewsItem item) {
    return ExpansionTile(
      key: Key(item.id.toString()),
      title: Text(item.title),
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("${item.descendants} comments"),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  if (await canLaunch(item.url)) launch(item.url);
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
