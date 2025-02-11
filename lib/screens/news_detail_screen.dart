import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final Map<String, String> news;

  NewsDetailScreen({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Details")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Image.asset(news["image"]!,
                width: double.infinity, height: 200, fit: BoxFit.cover),
            SizedBox(height: 10),
            Text(news["title"]!,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(news["date"]!, style: TextStyle(color: Colors.grey)),
            SizedBox(height: 10),
            Text(news["content"]!, style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            Text(
              "Source: ${news["source"]}",
              style: TextStyle(color: Colors.blue, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
