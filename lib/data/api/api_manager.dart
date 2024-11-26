import 'dart:convert';

import 'package:http/http.dart';

import 'model/article.dart';
import 'model/articles_response.dart';
import 'model/source.dart';
import 'model/sources_response.dart';


class ApiManager {
  static const String _baseUrl = "newsapi.org";
  static const String _sourcesEndPoint = "/v2/top-headlines/";
  static const String _articlesEndPoint = "/v2/everything";
  static const String _apiKey = "cf458e32fe31478caa9ca501aff550ff";
  static const String _defaultErrorMessage =
      "Something went wrong please try again later";
  static Future<List<Source>> getSources() async {
    try {
      Uri url = Uri.https(_baseUrl, _articlesEndPoint, {"apiKey": _apiKey});
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

  static Future<List<Article>> getArticles(Source source) async {
    try {
      Uri url = Uri.https(_baseUrl, _sourcesEndPoint,
          {"apiKey": _apiKey, "sources": source.id});
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
