import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app1/domain/entities/article_entity.dart';
import 'package:news_app1/domain/entities/source_entity.dart';
import 'package:news_app1/domain/repos/news_repo.dart';

part 'news_screen_state.dart';

class NewsScreenCubit extends Cubit<NewsScreenState> {
  NewsRepo newsRepo;
  late List<ArticleEntity> articles;
  late List<SourceEntity> sources;
  NewsScreenCubit(this.newsRepo) : super(NewsScreenInitial());
  List<ArticleEntity> getArticles(String sourceId) {
    emit(ArticlesLoading());
    newsRepo.getArticles(sourceId).then((articles) {
      emit(ArticlesLoaded(articles));
      this.articles = articles;
    },);
    return articles;
}
  List<SourceEntity> getSources(String categoryId) {
    emit(SourcesLoading());
    newsRepo.getSources(categoryId).then((sources) {
      emit(SourcesLoaded(sources));
      this.sources = sources;
    },);
    return sources;
  }
}
