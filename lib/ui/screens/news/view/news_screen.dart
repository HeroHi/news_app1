import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/domain/di/di.dart';
import 'package:news_app1/domain/entities/article_entity.dart';
import 'package:news_app1/ui/screens/detailed_article_screen/detailed_article_screen.dart';
import 'package:news_app1/ui/screens/news/cubit/news_screen_cubit.dart';
import 'package:news_app1/ui/screens/news/view/skeleton_article_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'custom_choice_chip.dart';
import 'article_widget.dart';

class NewsScreen extends StatefulWidget {
  static const routeName = "News";
  late String categoryId;
  int selectedTabIndex = 0;
  NewsScreen({
    super.key,
  });

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsScreenCubit newsCubit = getIt();
  late String sourceId;
  int page = 0;
  late List<ArticleEntity> searchedArticles;
  late List<ArticleEntity> articles;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  void _startSearching() {
    _isSearching = true;
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: () {
      Navigator.pop(context);
    }));
  }

  void searchFor({required String sourceId, required String q}) {
    newsCubit.getFilteredArticles(sourceId: sourceId, q: q);
  }

  void _stopSearching() {
    _isSearching = false;
    newsCubit.getArticles(sourceId);
    _searchController.clear();
  }



  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        newsCubit.getSources(widget.categoryId);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.categoryId = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) => newsCubit,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 40, child: _buildSourcesBloc()),
              _buildArticles(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticles() {
    return BlocBuilder<NewsScreenCubit, NewsScreenState>(
      buildWhen: (previous, current) =>
          current is ArticlesLoaded || current is ArticlesLoading||current is NewsScreenErrorState,
      builder: (context, state) {
        if(state is NewsScreenErrorState){
          return _buildRetryButton();
        }
        return Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: state is! ArticlesLoaded ? 10 : state.articles.length,
            itemBuilder: (context, index) => Skeletonizer(
                enabled: state is! ArticlesLoaded,
                child: (state is! ArticlesLoaded)
                    ? SkeletonArticleWidget()
                    : InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, DetailedArticleScreen.routeName,
                              arguments: state.articles[index]);
                        },
                        child: ArticleWidget(article: state.articles[index]))),
          ),
        );
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 72,
      title: _isSearching
          ? _buildSearchTextField()
          : Text(context.tr(widget.categoryId)),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _buildAppBarAction(),
        )
      ],
    );
  }

  Widget _buildSourcesBloc() {
    return BlocBuilder<NewsScreenCubit, NewsScreenState>(
      buildWhen: (previous, current) => current is SourcesLoaded,
      builder: (context, state) {
        if (state is SourcesLoaded) {
          if (widget.selectedTabIndex == 0) {
            newsCubit.getArticles(state.sources[0].id!);
            sourceId = state.sources[0].id!;
          }
        }
        return _buildSourcesList(state);
      },
    );
  }

  ListView _buildSourcesList(NewsScreenState state) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: state is SourcesLoaded ? state.sources.length : 10,
      itemBuilder: (context, index) => Skeletonizer(
        enabled: state is! SourcesLoaded,
        child: state is SourcesLoaded
            ? CustomChoiceChip(
                label: state.sources[index].name!,
                isSelected: index == widget.selectedTabIndex,
                onSelected: () {
                  sourceId = state.sources[index].id!;
                  widget.selectedTabIndex = index;
                  setState(() {});
                  newsCubit.getArticles(sourceId);
                },
              )
            : _buildSkeletonSource(),
      ),
    );
  }

  Widget _buildSkeletonSource() {
    return CustomChoiceChip(
        label: "skl label", onSelected: () {}, isSelected: false);
  }

  Widget _buildAppBarAction() {
    if (_isSearching) {
      return IconButton(
          onPressed: () {
            _stopSearching();
            setState(() {});
          },
          icon: Icon(
            Icons.clear,
          ));
    } else {
      return IconButton(
          onPressed: () {
            _startSearching();
            setState(() {});
          },
          icon: Icon(Icons.search));
    }
  }

  Widget _buildSearchTextField() {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: context.tr("searchForArticle"),
        hintStyle: Theme.of(context).textTheme.displaySmall,
      ),
      style: Theme.of(context).textTheme.displayMedium,
      onChanged: (value) {
        searchFor(sourceId: sourceId, q: value);
        setState(() {});
      },
    );
  }

  Widget _buildRetryButton() {
    return ElevatedButton(onPressed: (){
      newsCubit.getArticles(sourceId);
    }, child: ClipRect(
      child: Icon(Icons.roundabout_right_sharp),
    ));
  }
}
