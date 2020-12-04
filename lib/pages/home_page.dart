import 'package:flutter/material.dart';
import 'package:hacker_news/pages/story/best_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.favorite),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search),
          ),
        ],
        title: Center(
          child: Text(
            "Hacker News",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: DefaultTabController(
        length: 1,
        child: Scaffold(
          bottomNavigationBar: menu(context),
          body: TabBarView(
            children: [
              BestPage(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget menu(BuildContext context) {
  return Container(
    height: 60,
    color: Theme.of(context).primaryColor,
    child: TabBar(
      unselectedLabelColor: Colors.black,
      labelColor: Colors.white,
      tabs: [
        Tab(icon: Icon(Icons.post_add), text: "Post"),
      ],
    ),
  );
}

Widget loading(BuildContext context) {
  return Container(
    child: Center(
      child: CircularProgressIndicator(),
    ),
  );
}
