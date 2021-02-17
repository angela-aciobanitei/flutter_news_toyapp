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
                delegate: ArticleSearch(_currentIndex == 0
                    ? widget.bloc.topArticles
                    : widget.bloc.newArticles),
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
      body: _currentIndex == 0
          ? StreamBuilder<UnmodifiableListView<Article>>(
              stream: widget.bloc.topArticles,
              initialData: UnmodifiableListView<Article>([]),
              builder: (context, snapshot) => ListView(
                key: PageStorageKey(0),
                children: snapshot.data.map(_buildItem).toList(),
              ),
            )
          : StreamBuilder<UnmodifiableListView<Article>>(
              stream: widget.bloc.newArticles,
              initialData: UnmodifiableListView<Article>([]),
              builder: (context, snapshot) => ListView(
                key: PageStorageKey(1),
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
    // This widget is typically used with ListView to create an "expand / collapse"
    // list entry. When used with scrolling widgets like ListView, a unique
    // PageStorageKey must be specified to enable the ExpansionTile to save
    // and restore its expanded state when it is scrolled in and out of view.
    // Note: if PageStorageKey is not specified here too, it will throw an exception.
    return ExpansionTile(
      key: PageStorageKey(article.id),
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
