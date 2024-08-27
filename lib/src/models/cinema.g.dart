// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cinema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CinemaImpl _$$CinemaImplFromJson(Map<String, dynamic> json) => _$CinemaImpl(
      name: json['name'] as String,
      image: json['image'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      location: json['location'] as String,
      hall: json['hall'] as String,
      seats: (json['seats'] as List<dynamic>).map((e) => e as String).toList(),
      dateTime: json['dateTime'] == null
          ? null
          : DateTime.parse(json['dateTime'] as String),
    );

Map<String, dynamic> _$$CinemaImplToJson(_$CinemaImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'popularity': instance.popularity,
      'location': instance.location,
      'hall': instance.hall,
      'seats': instance.seats,
      'dateTime': instance.dateTime?.toIso8601String(),
    };
