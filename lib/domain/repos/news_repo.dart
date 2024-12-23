

import '../entities/article_entity.dart';
import '../entities/source_entity.dart';

abstract class NewsRepo{
   Future<List<SourceEntity>> getSources(String categoryId);
   Future<List<ArticleEntity>> getArticles(String sourceId);
   Future<List<ArticleEntity>> getArticlesByQ({required String sourceId,required String q});
}