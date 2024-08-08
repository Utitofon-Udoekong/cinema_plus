// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Genres {
  int id;
  String name;
  Genres({
    required this.id,
    required this.name,
  });


  Genres copyWith({
    int? id,
    String? name,
  }) {
    return Genres(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Genres.fromMap(Map<String, dynamic> map) {
    return Genres(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Genres.fromJson(String source) => Genres.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Genres(id: $id, name: $name)';

  @override
  bool operator ==(covariant Genres other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
