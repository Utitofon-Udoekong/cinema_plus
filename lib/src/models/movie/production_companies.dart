// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class ProductionCompanies {
  int id;
  String logoPath;
  String name;
  String originCountry;
  ProductionCompanies({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });


  ProductionCompanies copyWith({
    int? id,
    String? logoPath,
    String? name,
    String? originCountry,
  }) {
    return ProductionCompanies(
      id: id ?? this.id,
      logoPath: logoPath ?? this.logoPath,
      name: name ?? this.name,
      originCountry: originCountry ?? this.originCountry,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logoPath': logoPath,
      'name': name,
      'originCountry': originCountry,
    };
  }

  factory ProductionCompanies.fromMap(Map<String, dynamic> map) {
    return ProductionCompanies(
      id: map['id'] as int,
      logoPath: map['logoPath'] as String,
      name: map['name'] as String,
      originCountry: map['originCountry'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCompanies.fromJson(String source) => ProductionCompanies.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProductionCompanies(id: $id, logoPath: $logoPath, name: $name, originCountry: $originCountry)';
  }

  @override
  bool operator ==(covariant ProductionCompanies other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.logoPath == logoPath &&
      other.name == name &&
      other.originCountry == originCountry;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      logoPath.hashCode ^
      name.hashCode ^
      originCountry.hashCode;
  }
}
