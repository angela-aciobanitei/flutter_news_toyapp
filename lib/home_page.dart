import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_news_toyapp/src/article.dart';
import 'package:flutter_news_toyapp/src/article_search.dart';
import 'package:flutter_news_toyapp/src/hn_bloc.dart';
import 'package:flutter_news_toyapp/src/hn_web_view.dart';

class HomePage extends StatefulWidget {
  final String title;
  final HackerNewsBloc bloc;

  HomePage({Key key, this.title, this.bloc}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _updateCurrentIndex(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final Article result = await showSearch(
                context: context,
                delegate: ArticleSearch(widget.bloc.articles),
              );
              if (result != null) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HackerNewsWebView(url: result.url)));
              }
            },
          ),
        ],
      ),
      body: StreamBuilder<UnmodifiableListView<Article>>(
        stream: widget.bloc.articles,
        initialData: UnmodifiableListView<Article>([]),
        builder: (context, snapshot) => ListView(
          children: snapshot.data.map(_buildItem).toList(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.topic_outlined), label: 'Top Stories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.new_releases_outlined), label: 'New Stories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Favourites'),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          _updateCurrentIndex(index);
          if (index == 0) {
            widget.bloc.storiesType.add(StoriesType.topStories);
          } else {
            widget.bloc.storiesType.add(StoriesType.newStories);
          }
        },
      ),
    );
  }

  Widget _buildItem(Article article) {
    return ExpansionTile(
      key: Key(article.id.toString()),
      title: Text(article.title ?? '[null]',
          style: TextStyle(fontFamily: 'Garamond', fontSize: 16.0)),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('${article.descendants} comments',
                  style: TextStyle(fontFamily: 'Garamond')),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  // if (await canLaunch(article.url)) launch(article.url);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HackerNewsWebView(url: article.url)));
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
