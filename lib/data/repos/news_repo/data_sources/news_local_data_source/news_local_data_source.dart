import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:news_app1/data/api/model/article.dart';
import 'package:news_app1/data/api/model/source.dart';

@injectable
class NewsLocalDataSource{
  Future<List<Article>> getArticles(String sourceId) async{
    var box = await Hive.openBox('articles');
    List<Article> articles = box.get(sourceId);
    return articles;
  }
  void saveArticles(List<Article> articles,String sourceId) async{
    var box = await Hive.openBox('articles');
    box.put(sourceId, articles);
  }
  Future<List<Source>> getSources(String categoryId) async{
    var box = await Hive.openBox('sources');
    List<Source> sources = box.get(categoryId);
    return sources;
  }
  void saveSources(List<Source> sources,String categoryId) async{
    var box = await Hive.openBox('sources');
    box.put(categoryId, sources);
  }
}