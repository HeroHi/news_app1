import 'package:hive_flutter/adapters.dart';


import '../../../domain/entities/source_entity.dart';

class Source {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;
  Source({
    this.id,
    this.name,
    this.description,
    this.url,
    this.category,
    this.language,
    this.country,
  });

  SourceEntity toEntity(){
    return SourceEntity(
      id: id,
      name: name,
    );
  }

  Source.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    url = json['url'];
    category = json['category'];
    language = json['language'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['url'] = url;
    map['category'] = category;
    map['language'] = language;
    map['country'] = country;
    return map;
  }
}

class SourceAdapter extends TypeAdapter<Source> {
  @override
  final int typeId = 1;

  @override
  Source read(BinaryReader reader) {
    return Source.fromJson(reader.read());
  }

  @override
  void write(BinaryWriter writer, Source obj) {
    writer.write(obj.toJson());
  }
}