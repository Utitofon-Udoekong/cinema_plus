import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Cinema {
  String name;
  String image;
  int popularity;
  String location;
  Cinema({
    required this.name,
    required this.image,
    required this.popularity,
    required this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'popularity': popularity,
      'location': location,
    };
  }

  factory Cinema.fromMap(Map<String, dynamic> map) {
    return Cinema(
      name: map['name'] as String,
      image: map['image'] as String,
      popularity: map['popularity'] as int,
      location: map['location'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Cinema.fromJson(String source) => Cinema.fromMap(json.decode(source) as Map<String, dynamic>);
}
