
import 'article.dart';
import 'base_response.dart';

class ArticlesResponse extends BaseResponse {
  num? totalResults;
  List<Article>? articles;
  ArticlesResponse.fromJson(dynamic json) : super.fromJson(json) {
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Article.fromJson(v));
      });
    }
  }
}
