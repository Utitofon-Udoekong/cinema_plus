// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketImpl _$$TicketImplFromJson(Map<String, dynamic> json) => _$TicketImpl(
      bookingId: json['bookingId'] as String,
      movieId: (json['movieId'] as num).toInt(),
      movieTitle: json['movieTitle'] as String,
      moviePoster: json['moviePoster'] as String,
      date: DateTime.parse(json['date'] as String),
      hall: json['hall'] as String,
      cinema: json['cinema'] as String,
      location: json['location'] as String,
      row: json['row'] as String,
      seats: (json['seats'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$TicketImplToJson(_$TicketImpl instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'movieId': instance.movieId,
      'movieTitle': instance.movieTitle,
      'moviePoster': instance.moviePoster,
      'date': instance.date.toIso8601String(),
      'hall': instance.hall,
      'cinema': instance.cinema,
      'location': instance.location,
      'row': instance.row,
      'seats': instance.seats,
    };
