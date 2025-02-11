import 'package:flutter/material.dart';
import 'package:news_reader_app/database/music_database.dart';
import 'package:news_reader_app/database/sports_database.dart';
import 'package:news_reader_app/database/games_database.dart';
import 'package:news_reader_app/database/technology_database.dart';
import 'package:news_reader_app/screens/news_detail_screen.dart';
import 'package:news_reader_app/widgets.dart';

class NewsCategorizedScreen extends StatefulWidget {
  final String category;
  final Set<Map<String, String>> bookmarkedNews;

  NewsCategorizedScreen({required this.category, required this.bookmarkedNews});

  @override
  _NewsCategorizedScreenState createState() => _NewsCategorizedScreenState();
}

class _NewsCategorizedScreenState extends State<NewsCategorizedScreen> {
  List<Map<String, String>> categoryNews = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filterNews();
  }

  void _filterNews() {
    switch (widget.category) {
      case "Music":
        categoryNews = musicNews;
        break;
      case "Sports":
        categoryNews = sportsNews;
        break;
      case "Games":
        categoryNews = gamesNews;
        break;
      case "Technology":
        categoryNews = technologyNews;
        break;
    }
  }

  void searchNews(String query) {
    setState(() {
      categoryNews = categoryNews
          .where((news) =>
              news["title"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void toggleBookmark(Map<String, String> news) {
    setState(() {
      if (widget.bookmarkedNews.contains(news)) {
        widget.bookmarkedNews.remove(news);
      } else {
        widget.bookmarkedNews.add(news);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.category} News"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: searchController,
                onChanged: searchNews,
                decoration: InputDecoration(
                  hintText: "Search news...",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: categoryNews.length,
        itemBuilder: (context, index) {
          final news = categoryNews[index];
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
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.asset(
                      news["image"]!,
                      width: double.infinity,
                      height: 150,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 150,
                          color: Colors.grey[300],
                          child: Icon(Icons.broken_image,
                              size: 50, color: Colors.grey[600]),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news["title"]!,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 5),
                        Text(
                          news["date"]!,
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Source: ${news["source"]}",
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          widget.bookmarkedNews.contains(news)
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: Colors.blue,
                        ),
                        onPressed: () => toggleBookmark(news),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar:
          createBottomNavigator(context, widget.bookmarkedNews),
    );
  }
}
