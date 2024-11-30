import 'package:flutter/material.dart';
import 'package:news_app1/generated/assets.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
