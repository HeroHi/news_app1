import 'package:flutter/material.dart';
import 'package:news_app1/ui/screens/home/home.dart';
import 'package:news_app1/ui/screens/news/view/news_screen.dart';
import 'package:news_app1/ui/utils/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.theme,
      routes: {
        Home.routeName: (_)=> Home(),
        NewsScreen.routeName:(_)=>NewsScreen()
      },
      initialRoute: NewsScreen.routeName,
    );
  }
}