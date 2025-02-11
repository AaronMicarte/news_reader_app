import 'package:flutter/material.dart';
import 'package:news_reader_app/screens/news_categorized_screen.dart';
import 'package:news_reader_app/screens/view_bookmarks.dart';

PreferredSizeWidget createAppBar() {
  return AppBar(
    title: Text("News Reader"),
    backgroundColor: Color(0xFF1E3A8A),
  );
}

Widget createDrawer(
    BuildContext context, Set<Map<String, String>> bookmarkedNews) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF1E3A8A)),
          child: Text("News Categories",
              style: TextStyle(color: Colors.white, fontSize: 18)),
        ),
        ListTile(
          title: Text("Music"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsCategorizedScreen(
                    category: "Music", bookmarkedNews: bookmarkedNews),
              ),
            );
          },
        ),
        ListTile(
          title: Text("Sports"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsCategorizedScreen(
                    category: "Sports", bookmarkedNews: bookmarkedNews),
              ),
            );
          },
        ),
        ListTile(
          title: Text("Games"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsCategorizedScreen(
                    category: "Games", bookmarkedNews: bookmarkedNews),
              ),
            );
          },
        ),
        ListTile(
          title: Text("Technology"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NewsCategorizedScreen(
                    category: "Technology", bookmarkedNews: bookmarkedNews),
              ),
            );
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.bookmark),
          title: Text("Bookmarks"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewBookmarks(bookmarkedNews),
              ),
            );
          },
        ),
      ],
    ),
  );
}

Widget createBottomNavigator(
    BuildContext context, Set<Map<String, String>> bookmarkedNews) {
  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(icon: Icon(Icons.home), onPressed: () {}),
        IconButton(
          icon: Icon(Icons.bookmark),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ViewBookmarks(bookmarkedNews);
                },
              ),
            );
          },
        ),
      ],
    ),
  );
}
