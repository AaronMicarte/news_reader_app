import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final Map<String, String> news;

  NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Details"),
        elevation: 0,
        backgroundColor: Color(0xFF1976D2),
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                news["image"]!,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.grey[200],
                    child: Center(
                      child: Icon(Icons.broken_image,
                          size: 50, color: Colors.grey[400]),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            Text(
              news["title"]!,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            SizedBox(height: 8),
            Text(
              news["date"]!,
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              news["content"]!,
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text(
              "Source: ${news["source"]}",
              style: TextStyle(color: Color(0xFF00B8D4), fontSize: 14),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[50],
    );
  }
}
