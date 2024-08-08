// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductionCountries {
  String iso31661;
  String name;
  ProductionCountries({
    required this.iso31661,
    required this.name,
  });


  ProductionCountries copyWith({
    String? iso31661,
    String? name,
  }) {
    return ProductionCountries(
      iso31661: iso31661 ?? this.iso31661,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iso31661': iso31661,
      'name': name,
    };
  }

  factory ProductionCountries.fromMap(Map<String, dynamic> map) {
    return ProductionCountries(
      iso31661: map['iso31661'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductionCountries.fromJson(String source) => ProductionCountries.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductionCountries(iso31661: $iso31661, name: $name)';

  @override
  bool operator ==(covariant ProductionCountries other) {
    if (identical(this, other)) return true;
  
    return 
      other.iso31661 == iso31661 &&
      other.name == name;
  }

  @override
  int get hashCode => iso31661.hashCode ^ name.hashCode;
}
