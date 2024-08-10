// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Clip {
  int id;
  List<Results> results;
  Clip({
    required this.id,
    required this.results,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory Clip.fromMap(Map<String, dynamic> map) {
    return Clip(
      id: map['id'] as int,
      results: List<Results>.from((map['results'] as List<int>).map<Results>((x) => Results.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Clip.fromJson(String source) => Clip.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Results {
  String iso6391;
  String iso31661;
  String name;
  String key;
  String site;
  int size;
  String type;
  bool official;
  String publishedAt;
  String id;

  Results({
    required this.iso6391,
    required this.iso31661,
    required this.name,
    required this.key,
    required this.site,
    required this.size,
    required this.type,
    required this.official,
    required this.publishedAt,
    required this.id,
  });

  

  Results copyWith({
    String? iso6391,
    String? iso31661,
    String? name,
    String? key,
    String? site,
    int? size,
    String? type,
    bool? official,
    String? publishedAt,
    String? id,
  }) {
    return Results(
      iso6391: iso6391 ?? this.iso6391,
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
      key: key ?? this.key,
      site: site ?? this.site,
      size: size ?? this.size,
      type: type ?? this.type,
      official: official ?? this.official,
      publishedAt: publishedAt ?? this.publishedAt,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso6391': iso6391,
      'iso31661': iso31661,
      'name': name,
      'key': key,
      'site': site,
      'size': size,
      'type': type,
      'official': official,
      'publishedAt': publishedAt,
      'id': id,
    };
  }

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      iso6391: map['iso6391'] as String,
      iso31661: map['iso31661'] as String,
      name: map['name'] as String,
      key: map['key'] as String,
      site: map['site'] as String,
      size: map['size'] as int,
      type: map['type'] as String,
      official: map['official'] as bool,
      publishedAt: map['publishedAt'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(String source) => Results.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Results(iso6391: $iso6391, iso31661: $iso31661, name: $name, key: $key, site: $site, size: $size, type: $type, official: $official, publishedAt: $publishedAt, id: $id)';
  }

  @override
  bool operator ==(covariant Results other) {
    if (identical(this, other)) return true;
  
    return 
      other.iso6391 == iso6391 &&
      other.iso31661 == iso31661 &&
      other.name == name &&
      other.key == key &&
      other.site == site &&
      other.size == size &&
      other.type == type &&
      other.official == official &&
      other.publishedAt == publishedAt &&
      other.id == id;
  }

  @override
  int get hashCode {
    return iso6391.hashCode ^
      iso31661.hashCode ^
      name.hashCode ^
      key.hashCode ^
      site.hashCode ^
      size.hashCode ^
      type.hashCode ^
      official.hashCode ^
      publishedAt.hashCode ^
      id.hashCode;
  }
}
