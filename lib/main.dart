import 'package:flutter/material.dart';
import 'package:news_reader_app/screens/news_list%20_screen.dart';
import 'widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF1E3A8A),
        scaffoldBackgroundColor: Color(0xFFF3F4F6),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF1E293B)),
        ),
      ),
      home: NewsMainPage(),
    );
  }
}

class NewsMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: NewsListScreen(),
    );
  }
}
