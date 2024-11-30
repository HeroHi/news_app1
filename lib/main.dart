import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app1/domain/di/di.dart';
import 'package:news_app1/ui/screens/home/home.dart';
import 'package:news_app1/ui/screens/news/view/news_screen.dart';
import 'package:news_app1/ui/screens/splash/splash_screen.dart';
import 'package:news_app1/utils/consts/app_themes.dart';
import 'data/api/model/article.dart';
import 'data/api/model/source.dart';
import 'ui/screens/detailed_article_screen/detailed_article_screen.dart';


void main() async{
  configureDependencies();
  await Hive.initFlutter();
  Hive.registerAdapter(SourceAdapter());
  Hive.registerAdapter(ArticleAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        fallbackLocale: Locale('en'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.theme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routes: {
        Home.routeName: (_)=> Home(),
        NewsScreen.routeName:(_)=>NewsScreen(),
        DetailedArticleScreen.routeName:(_)=>DetailedArticleScreen(),
        SplashScreen.routeName:(_)=>SplashScreen()
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}