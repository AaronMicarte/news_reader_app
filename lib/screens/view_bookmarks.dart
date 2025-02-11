import 'package:flutter/material.dart';
import 'package:news_reader_app/screens/news_detail_screen.dart';

class ViewBookmarks extends StatelessWidget {
  final Set<Map<String, String>> bookmarkedNews;

  ViewBookmarks(this.bookmarkedNews);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bookmarked News")),
      body: bookmarkedNews.isEmpty
          ? Center(child: Text("No bookmarks yet."))
          : ListView.builder(
              itemCount: bookmarkedNews.length,
              itemBuilder: (context, index) {
                final news = bookmarkedNews.elementAt(index);
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailScreen(news: news),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: ListTile(
                      leading: Image.asset(
                        news["image"]!,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.broken_image);
                        },
                      ),
                      title: Text(news["title"]!),
                      subtitle: Text(news["date"]!),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
