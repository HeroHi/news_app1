import 'dart:convert';

import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

import '../../../../api/model/article.dart';
import '../../../../api/model/articles_response.dart';
import '../../../../api/model/source.dart';
import '../../../../api/model/sources_response.dart';

@injectable
class NewsRemoteDataSource {
  static const String _baseUrl = "newsapi.org";
  static const String _sourcesEndPoint = "/v2/top-headlines/sources";
  static const String _articlesEndPoint = "/v2/top-headlines";
   static const String _apiKey = "cf458e32fe31478caa9ca501aff550ff";
   static const String _defaultErrorMessage =
      "Something went wrong please try again later";
   Future<List<Source>> getSources(String categoryId) async {
    try {
      Uri url = Uri.https(_baseUrl, _sourcesEndPoint, {"apiKey": _apiKey,"category":categoryId});
      Response serverResponse = await get(url);
      SourcesResponse sourcesResponse =
      SourcesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
        return sourcesResponse.sources!;
      } else {
        throw sourcesResponse.message ?? _defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Article>> getArticles(String sourceId) async {
    try {
      Uri url = Uri.https(_baseUrl, _articlesEndPoint,
          {"apiKey": _apiKey, "sources": sourceId});
      Response serverResponse = await get(url);
      ArticlesResponse articlesResponse =
      ArticlesResponse.fromJson(jsonDecode(serverResponse.body));
      if (serverResponse.statusCode >= 200 && serverResponse.statusCode < 300) {
        return articlesResponse.articles!;
      } else {
        throw articlesResponse.message ?? _defaultErrorMessage;
      }
    } catch (e) {
      rethrow;
    }
  }
}
