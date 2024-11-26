import 'package:flutter/material.dart';


import '../../../utils/widgets/custom_drawer.dart';
import '../custom_choice_chip.dart';
import 'article_widget.dart';

class NewsScreen extends StatelessWidget {
  static const routeName = "News";
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  itemBuilder: (context, index) => ArticleWidget(),),
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
