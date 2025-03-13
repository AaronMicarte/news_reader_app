import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
        backgroundColor: Color(0xFF1976D2),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hey there! 👋",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),
              Text(
                "Welcome to the News Reader App! This app was created by just two people with a passion for making news easier to find and read. We worked hard to keep it simple, clean, and useful for everyone.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "What this app is all about:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "- Get the latest news from different categories like music, sports, tech, and more.\n"
                "- Bookmark articles you want to read later.\n"
                "- Enjoy a smooth and user-friendly experience.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Got feedback or ideas? 💡",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "We’d love to hear from you! Whether it’s a suggestion, question, or just a hello, feel free to reach out.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(Icons.mail, color: Color(0xFF1976D2), size: 20),
                  SizedBox(width: 10),
                  Text(
                    "Email us at: micarte2005@gmail.com",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Icon(Icons.message, color: Color(0xFF1976D2), size: 20),
                  SizedBox(width: 10),
                  Text(
                    "Send us a DM on Instagram: @lilychouchou._",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[50],
    );
  }
}
