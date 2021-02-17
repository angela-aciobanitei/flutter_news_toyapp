import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'article.dart';

class ArticleSearch extends SearchDelegate<Article> {
  final Stream<UnmodifiableListView<Article>> articles;

  ArticleSearch(this.articles);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, null),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return StreamBuilder<UnmodifiableListView<Article>>(
      stream: articles,
      builder: (context, AsyncSnapshot<UnmodifiableListView<Article>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Text('No data!'));
        }

        final results = snapshot.data.where((article) =>
            article.title.toLowerCase().contains(query.toLowerCase()));

        return ListView(
          children: results
              .map((article) => ListTile(
                    title: Text(article.url, style: TextStyle(fontSize: 16.0)),
                    leading: Icon(Icons.menu),
                    onTap: () async {
                      if (await canLaunch(article.url)) {
                        await launch(article.url);
                      }
                      close(context, article);
                    },
                  ))
              .toList(),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder<UnmodifiableListView<Article>>(
      stream: articles,
      builder: (context, AsyncSnapshot<UnmodifiableListView<Article>> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Text('No data!'));
        }

        final results = snapshot.data.where((article) =>
            article.title.toLowerCase().contains(query.toLowerCase()));

        return ListView(
          children: results
              .map((article) => ListTile(
                  title: Text(article.title, style: TextStyle(fontSize: 16.0)),
                  onTap: () => close(context, article)))
              .toList(),
        );
      },
    );
  }
}
