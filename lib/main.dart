import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/home_page.dart';
import 'models/saved_words.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SavedWords(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Translate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(title: 'Google Translate'),
      themeMode: ThemeMode.dark
    );
  }
}