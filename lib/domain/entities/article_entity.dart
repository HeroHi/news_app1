
import 'package:news_app1/domain/entities/source_entity.dart';

class ArticleEntity{
  SourceEntity? source;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
  ArticleEntity({
    required this.source,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });
}