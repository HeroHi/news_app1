

import 'package:connectivity_plus/connectivity_plus.dart';
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
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)){
      var articles = await _newsRemoteDataSource.getArticles(sourceId);
      _newsLocalDataSource.saveArticles(articles, sourceId);
      return articles.map((articleModel) => articleModel.toEntity() ,).toList();
    }
    var articles = await _newsLocalDataSource.getArticles(sourceId);
    return articles.map((articleModel) => articleModel.toEntity() ,).toList();
  }

  @override
  Future<List<SourceEntity>> getSources(String categoryId) async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult.contains(ConnectivityResult.mobile)||connectivityResult.contains(ConnectivityResult.wifi)){
      var sources = await _newsRemoteDataSource.getSources(categoryId);
      _newsLocalDataSource.saveSources(sources, categoryId);
      return (sources.map(
            (sourceModel) => sourceModel.toEntity(),
      )).toList();
    }
    var sources = await _newsLocalDataSource.getSources(categoryId);
    return (sources.map(
          (sourceModel) => sourceModel.toEntity(),
    )).toList();

  }
  @override
  Future<List<ArticleEntity>> getArticlesByQ({required String sourceId,required String q})async{
    var articles = await _newsRemoteDataSource.getArticlesByQ(q,sourceId);
    return articles.map((articleModel) => articleModel.toEntity() ,).toList();
  }
}
