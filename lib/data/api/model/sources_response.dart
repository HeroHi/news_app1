
import 'base_response.dart';
import 'source.dart';

class SourcesResponse extends BaseResponse {
  List<Source>? sources;

  SourcesResponse.fromJson(dynamic json) : super.fromJson(json) {
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }
}
