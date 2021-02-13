import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'src/article.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> _articles = articles;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView(children: _articles.map(_buildItem).toList()),
      );
  }
}

Widget _buildItem(Article article) {
  return ExpansionTile(
    title: Text(article.text),
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("${article.commentsCount} comments"),
            IconButton(
              icon: Icon(Icons.launch),
              onPressed: () async {
                final fakeUrl = "http://${article.domain}";
                if (await canLaunch(fakeUrl)) launch(fakeUrl);
              },
            )
          ],
        ),
      )
    ],
  );
}
