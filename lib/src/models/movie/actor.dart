// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Actor {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  String birthday;
  String? deathday;
  int gender;
  String? homepage;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;
  Actor({
    required this.adult,
    required this.alsoKnownAs,
    required this.biography,
    required this.birthday,
    this.deathday,
    required this.gender,
    this.homepage,
    required this.id,
    required this.imdbId,
    required this.knownForDepartment,
    required this.name,
    required this.placeOfBirth,
    required this.popularity,
    required this.profilePath,
  });

  Actor copyWith({
    bool? adult,
    List<String>? alsoKnownAs,
    String? biography,
    String? birthday,
    String? deathday,
    int? gender,
    String? homepage,
    int? id,
    String? imdbId,
    String? knownForDepartment,
    String? name,
    String? placeOfBirth,
    double? popularity,
    String? profilePath,
  }) {
    return Actor(
      adult: adult ?? this.adult,
      alsoKnownAs: alsoKnownAs ?? this.alsoKnownAs,
      biography: biography ?? this.biography,
      birthday: birthday ?? this.birthday,
      deathday: deathday ?? this.deathday,
      gender: gender ?? this.gender,
      homepage: homepage ?? this.homepage,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      name: name ?? this.name,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      popularity: popularity ?? this.popularity,
      profilePath: profilePath ?? this.profilePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'alsoKnownAs': alsoKnownAs,
      'biography': biography,
      'birthday': birthday,
      'deathday': deathday,
      'gender': gender,
      'homepage': homepage,
      'id': id,
      'imdbId': imdbId,
      'knownForDepartment': knownForDepartment,
      'name': name,
      'placeOfBirth': placeOfBirth,
      'popularity': popularity,
      'profilePath': profilePath,
    };
  }

  factory Actor.fromMap(Map<String, dynamic> map) {
    return Actor(
      adult: map['adult'] as bool,
      alsoKnownAs: List<String>.from((map['alsoKnownAs'] as List<String>)),
      biography: map['biography'] as String,
      birthday: map['birthday'] as String,
      deathday: map['deathday'] != null ? map['deathday'] as String : null,
      gender: map['gender'] as int,
      homepage: map['homepage'] != null ? map['homepage'] as String : null,
      id: map['id'] as int,
      imdbId: map['imdbId'] as String,
      knownForDepartment: map['knownForDepartment'] as String,
      name: map['name'] as String,
      placeOfBirth: map['placeOfBirth'] as String,
      popularity: map['popularity'] as double,
      profilePath: map['profilePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Actor.fromJson(String source) => Actor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Actor(adult: $adult, alsoKnownAs: $alsoKnownAs, biography: $biography, birthday: $birthday, deathday: $deathday, gender: $gender, homepage: $homepage, id: $id, imdbId: $imdbId, knownForDepartment: $knownForDepartment, name: $name, placeOfBirth: $placeOfBirth, popularity: $popularity, profilePath: $profilePath)';
  }

  @override
  bool operator ==(covariant Actor other) {
    if (identical(this, other)) return true;
  
    return 
      other.adult == adult &&
      listEquals(other.alsoKnownAs, alsoKnownAs) &&
      other.biography == biography &&
      other.birthday == birthday &&
      other.deathday == deathday &&
      other.gender == gender &&
      other.homepage == homepage &&
      other.id == id &&
      other.imdbId == imdbId &&
      other.knownForDepartment == knownForDepartment &&
      other.name == name &&
      other.placeOfBirth == placeOfBirth &&
      other.popularity == popularity &&
      other.profilePath == profilePath;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
      alsoKnownAs.hashCode ^
      biography.hashCode ^
      birthday.hashCode ^
      deathday.hashCode ^
      gender.hashCode ^
      homepage.hashCode ^
      id.hashCode ^
      imdbId.hashCode ^
      knownForDepartment.hashCode ^
      name.hashCode ^
      placeOfBirth.hashCode ^
      popularity.hashCode ^
      profilePath.hashCode;
  }
}
