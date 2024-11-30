import 'package:flutter/material.dart';
import 'package:news_app1/generated/assets.dart';

import '../home/home.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 4),() {
      Navigator.pushReplacementNamed(context, Home.routeName);
    },);
    return Scaffold(
      body: DecoratedBox(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesPattern),
                  fit: BoxFit.cover)),
          child: Center(child: Image.asset(Assets.imagesLogo))),
    );
  }
}
