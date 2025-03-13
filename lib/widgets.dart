import 'package:flutter/material.dart';
import 'package:news_reader_app/main.dart';
import 'package:news_reader_app/screens/news_categorized.dart';
import 'package:news_reader_app/screens/view_bookmarks.dart';
import 'package:news_reader_app/screens/about_us.dart';

PreferredSizeWidget createAppBar() {
  return AppBar(
    title: Text("News Reader", style: TextStyle(fontWeight: FontWeight.w600)),
    backgroundColor: Color(0xFF1976D2),
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  );
}

Widget createDrawer(
    BuildContext context, Set<Map<String, String>> bookmarkedNews) {
  return Drawer(
    child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Color(0xFF1976D2)),
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
          leading: Icon(Icons.bookmark, color: Color(0xFF1976D2)),
          title: Text("Bookmarks", style: TextStyle(color: Colors.black87)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewBookmarks(bookmarkedNews),
              ),
            );
          },
        ),
        Divider(),
        ListTile(
          title: Text("About Us", style: TextStyle(color: Colors.black87)),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AboutUsScreen(),
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
        IconButton(
          icon: Icon(Icons.home),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return NewsMainPage();
                },
              ),
            );
          },
        ),
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
