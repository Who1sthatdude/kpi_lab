import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:kpi_lab/pages/animations_page.dart';
import 'package:kpi_lab/pages/saved_words_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/home_page.dart';
import 'models/saved_words.dart';
import 'package:http/http.dart' as http;

Future<String> getDataSimulation() async {
  String str = await processDataFetching();
  return str;
}

Future<String> processDataFetching() => Future.delayed(
  const Duration(seconds: 10),
      () => 'Fetched data returned',
);

Future<List<dynamic>> getJsonFromGithub() async {
  final response = await http.get(Uri.parse(
      "https://raw.githubusercontent.com/Who1sthatdude/kpi_lab/lab_4/for_http_request.json"));
  if (response.statusCode == 200) {
    Map<String, dynamic> map = jsonDecode(response.body);
    List<dynamic> list= [];
    list.add(map['Name']);
    list.add(map['Last Name']);
    list.add(map['Group']);
    return list;
  } else {
    throw Exception('Unable to parse request');
  }
}

Future<void> printJson() async {
  print(await getJsonFromGithub());
}

void main() {
  getDataSimulation().then((response) {
    print(response);
  });
  printJson();

  runApp(
    ChangeNotifierProvider(
      create: (context) => SavedWords(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget
{
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isDarkTheme = true;

  void switchTheme() {
    setState(() {
      isDarkTheme = !isDarkTheme;
      SharedPreferences.getInstance().then((sp) {
        sp.setBool('isDarkTheme', isDarkTheme);
      });
    });
  }

  _MyAppState() {
    SharedPreferences.getInstance().then((sp) {
      setState(() {
        isDarkTheme = sp.getBool('isDarkTheme') ?? true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Translate',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(title: 'Google Translate', switchTheme: switchTheme),
        '/saved': (context) => SavedWordsPage(title: 'Google translate'),
        '/animation': (context) => CustomAnimation(title: 'Google translate')
      },
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
    );
  }
}