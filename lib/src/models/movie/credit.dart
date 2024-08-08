// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:cinema_plus/src/models/movie/cast.dart';

class Credit {
  int id;
  List<Cast> cast;
  
  Credit({
    required this.id,
    required this.cast,
  });

  

  Credit copyWith({
    int? id,
    List<Cast>? cast,
  }) {
    return Credit(
      id: id ?? this.id,
      cast: cast ?? this.cast,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory Credit.fromMap(Map<String, dynamic> map) {
    return Credit(
      id: map['id'] as int,
      cast: List<Cast>.from((map['cast'] as List<int>).map<Cast>((x) => Cast.fromMap(x as Map<String,dynamic>),),),
    );
  }

  String toJson() => json.encode(toMap());

  factory Credit.fromJson(String source) => Credit.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Credit(id: $id, cast: $cast)';

  @override
  bool operator ==(covariant Credit other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      listEquals(other.cast, cast);
  }

  @override
  int get hashCode => id.hashCode ^ cast.hashCode;
}
