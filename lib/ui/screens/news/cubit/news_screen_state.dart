part of 'news_screen_cubit.dart';

abstract class NewsScreenState {

}
final class NewsScreenInitial extends NewsScreenState {}
class ArticlesLoaded extends NewsScreenState{
  final List<ArticleEntity> articles;
  ArticlesLoaded(this.articles);
}
class SourcesLoaded extends NewsScreenState{
  final List<SourceEntity> sources;
  SourcesLoaded(this.sources);
}
class SourcesLoading extends NewsScreenState{}
class ArticlesLoading extends NewsScreenState{}
class NewsScreenErrorState extends NewsScreenState{
  final String errorMsg;
  NewsScreenErrorState(this.errorMsg);
}