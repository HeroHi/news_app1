import 'package:hive_flutter/adapters.dart';
import 'package:news_app1/data/api/model/source.dart';

import '../../../domain/entities/article_entity.dart';

class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

  ArticleEntity toEntity() {
    return ArticleEntity(
        content: content,
        description: description,
        publishedAt: publishedAt,
        source: source!.toEntity(),
        title: title,
        url: url,
        urlToImage: urlToImage);
  }
}

class ArticleAdapter extends TypeAdapter<Article> {
  @override
  final int typeId = 2;

  @override
  Article read(BinaryReader reader) {
    return Article.fromJson(reader.read());
  }

  @override
  void write(BinaryWriter writer, Article obj) {
    writer.write(obj.toJson());
  }
}