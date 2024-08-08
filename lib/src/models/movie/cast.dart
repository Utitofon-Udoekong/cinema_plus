// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Cast {
  bool adult;
  int gender;
  int id;
  String knownForDepartment;
  String name;
  String originalName;
  double popularity;
  String profilePath;
  int castId;
  String character;
  String creditId;
  int order;
  Cast({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownForDepartment,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.profilePath,
    required this.castId,
    required this.character,
    required this.creditId,
    required this.order,
  });


  Cast copyWith({
    bool? adult,
    int? gender,
    int? id,
    String? knownForDepartment,
    String? name,
    String? originalName,
    double? popularity,
    String? profilePath,
    int? castId,
    String? character,
    String? creditId,
    int? order,
  }) {
    return Cast(
      adult: adult ?? this.adult,
      gender: gender ?? this.gender,
      id: id ?? this.id,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      name: name ?? this.name,
      originalName: originalName ?? this.originalName,
      popularity: popularity ?? this.popularity,
      profilePath: profilePath ?? this.profilePath,
      castId: castId ?? this.castId,
      character: character ?? this.character,
      creditId: creditId ?? this.creditId,
      order: order ?? this.order,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adult': adult,
      'gender': gender,
      'id': id,
      'knownForDepartment': knownForDepartment,
      'name': name,
      'originalName': originalName,
      'popularity': popularity,
      'profilePath': profilePath,
      'castId': castId,
      'character': character,
      'creditId': creditId,
      'order': order,
    };
  }

  factory Cast.fromMap(Map<String, dynamic> map) {
    return Cast(
      adult: map['adult'] as bool,
      gender: map['gender'] as int,
      id: map['id'] as int,
      knownForDepartment: map['knownForDepartment'] as String,
      name: map['name'] as String,
      originalName: map['originalName'] as String,
      popularity: map['popularity'] as double,
      profilePath: map['profilePath'] as String,
      castId: map['castId'] as int,
      character: map['character'] as String,
      creditId: map['creditId'] as String,
      order: map['order'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cast.fromJson(String source) => Cast.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Cast(adult: $adult, gender: $gender, id: $id, knownForDepartment: $knownForDepartment, name: $name, originalName: $originalName, popularity: $popularity, profilePath: $profilePath, castId: $castId, character: $character, creditId: $creditId, order: $order)';
  }

  @override
  bool operator ==(covariant Cast other) {
    if (identical(this, other)) return true;
  
    return 
      other.adult == adult &&
      other.gender == gender &&
      other.id == id &&
      other.knownForDepartment == knownForDepartment &&
      other.name == name &&
      other.originalName == originalName &&
      other.popularity == popularity &&
      other.profilePath == profilePath &&
      other.castId == castId &&
      other.character == character &&
      other.creditId == creditId &&
      other.order == order;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
      gender.hashCode ^
      id.hashCode ^
      knownForDepartment.hashCode ^
      name.hashCode ^
      originalName.hashCode ^
      popularity.hashCode ^
      profilePath.hashCode ^
      castId.hashCode ^
      character.hashCode ^
      creditId.hashCode ^
      order.hashCode;
  }
}
