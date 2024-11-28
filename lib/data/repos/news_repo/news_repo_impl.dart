

import 'package:injectable/injectable.dart';

import '../../../domain/entities/article_entity.dart';
import '../../../domain/entities/source_entity.dart';
import '../../../domain/repos/news_repo.dart';
import 'data_sources/news_local_data_source/news_local_data_source.dart';
import 'data_sources/news_remote_data_source/news_remote_data_source.dart';
@Injectable(as: NewsRepo)
class NewsRepoImpl extends NewsRepo {
  final NewsRemoteDataSource _newsRemoteDataSource;
  final NewsLocalDataSource _newsLocalDataSource;
  NewsRepoImpl(this._newsLocalDataSource, this._newsRemoteDataSource);
  @override
  Future<List<ArticleEntity>> getArticles(String sourceId) async {
    var articles = await _newsRemoteDataSource.getArticles(sourceId);

    return articles.map((articleModel) => articleModel.toEntity() ,).toList();
  }

  @override
  Future<List<SourceEntity>> getSources(String categoryId) async {
    var sources = await _newsRemoteDataSource.getSources(categoryId);
    return (sources.map(
      (sourceModel) => sourceModel.toEntity(),
    )).toList();
  }
}
