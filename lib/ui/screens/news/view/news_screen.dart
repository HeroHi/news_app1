import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/ui/screens/news/cubit/news_screen_cubit.dart';


import '../../../widgets/custom_drawer.dart';
import '../custom_choice_chip.dart';
import 'article_widget.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = "News";
  late String categoryId;
  NewsScreen({super.key,});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    widget.categoryId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      drawer: CustomDrawer(onItemTab: (index){}),
      appBar: AppBar(
        toolbarHeight: 72,
        title: Text("Sports"),
        actions: [Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Icon(Icons.search,size: 40,),
        )],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
                child: _buildSourcesList()),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: 6,
                  itemBuilder: (context, index) => Container(),),
              )
          ],
        ),
      ),
    );
  }

  Widget _buildSourcesList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) =>
          CustomChoiceChip(label: "source$index", selected: index == 0),
    );
  }
}
