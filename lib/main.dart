import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app1/domain/di/di.dart';
import 'package:news_app1/ui/screens/home/home.dart';
import 'package:news_app1/ui/screens/news/view/news_screen.dart';
import 'package:news_app1/utils/consts/app_themes.dart';

import 'data/api/model/article.dart';
import 'data/api/model/source.dart';
import 'ui/screens/detailed_article_screen/detailed_article_screen.dart';


void main() async{
  configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  Hive.registerAdapter(ArticleAdapter());
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
        NewsScreen.routeName:(_)=>NewsScreen(),
        DetailedArticleScreen.routeName:(_)=>DetailedArticleScreen()
      },
      initialRoute: Home.routeName,
    );
  }
}