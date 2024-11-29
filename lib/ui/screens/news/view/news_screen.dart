import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/domain/di/di.dart';
import 'package:news_app1/ui/screens/news/cubit/news_screen_cubit.dart';
import 'package:news_app1/utils/consts/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../widgets/custom_drawer.dart';
import 'custom_choice_chip.dart';
import 'article_widget.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = "News";
  late String categoryId;
  NewsScreen({
    super.key,
  });

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsScreenCubit newsCubit = getIt();
  late String sourceId;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        widget.categoryId =
            ModalRoute.of(context)!.settings.arguments as String;
        newsCubit.getSources(widget.categoryId);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsCubit,
      child: Scaffold(
        drawer: CustomDrawer(onItemTab: (index) {}),
        appBar: _buildAppBar(),
        body:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 40, child: _buildSourcesList()),
              _buildArticles(true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticles(bool isSkeleton) {
    return BlocBuilder<NewsScreenCubit, NewsScreenState>(
      buildWhen: (previous, current) => current is ArticlesLoaded,
  builder: (context, state) {
      if (state is ArticlesLoaded) {
        return Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount:state.articles.length,
          itemBuilder: (context, index) => ArticleWidget(article: state.articles[index]),
        ),
            );
      }
      return Center(child: CircularProgressIndicator(),);
  },
);
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 72,
      title: Text("Sports"),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Icon(
            Icons.search,
            size: 40,
          ),
        )
      ],
    );
  }

  Widget _buildSourcesList() {
    return BlocBuilder<NewsScreenCubit, NewsScreenState>(
      buildWhen: (previous, current){
        print("current: $current, previous: $previous");
        return current is SourcesLoaded;
      },
  builder: (context, state) {
     if (state is SourcesLoaded) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.sources.length,
        itemBuilder: (context, index) => CustomChoiceChip(
          label: state.sources[index].name!,
          isSelected: index == 0,
          onSelected: () {
            sourceId = state.sources[index].id!;
            newsCubit.getArticles(sourceId);
          },
        ),
      );
    }
    return CircularProgressIndicator();
  },
);
  }
}
