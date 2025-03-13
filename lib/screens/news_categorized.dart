import 'package:flutter/material.dart';
import 'package:news_reader_app/database/music_database.dart';
import 'package:news_reader_app/database/sports_database.dart';
import 'package:news_reader_app/database/games_database.dart';
import 'package:news_reader_app/database/technology_database.dart';
import 'package:news_reader_app/screens/news_detail.dart';
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
  List<Map<String, String>> filteredNews = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filterNews();
    filteredNews = List.from(categoryNews);
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
      filteredNews = categoryNews
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
        title: Text(
          "${widget.category} News",
        ),
        elevation: 0,
        backgroundColor: Color(0xFF1976D2),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: SizedBox(
              width: 220,
              child: TextField(
                controller: searchController,
                onChanged: searchNews,
                decoration: InputDecoration(
                  hintText: "Search news...",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                  filled: true,
                  fillColor: Colors.grey[100],
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                ),
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        padding: EdgeInsets.all(8),
        itemCount: filteredNews.length,
        itemBuilder: (context, index) {
          final news = filteredNews[index];
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
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      news["image"]!,
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: double.infinity,
                          height: 120,
                          color: Colors.grey[200],
                          child: Center(
                            child: Icon(Icons.broken_image,
                                size: 40, color: Colors.grey[400]),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news["title"]!,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.black87,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Source: ${news["source"]}",
                              style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                widget.bookmarkedNews.contains(news)
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                color: Colors.blue[600],
                                size: 18,
                              ),
                              onPressed: () => toggleBookmark(news),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar:
          createBottomNavigator(context, widget.bookmarkedNews),
      backgroundColor: Colors.grey[50],
    );
  }
}
