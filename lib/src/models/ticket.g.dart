// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketImpl _$$TicketImplFromJson(Map<String, dynamic> json) => _$TicketImpl(
      bookingId: json['bookingId'] as String,
      movie: Movie.fromJson(json['movie'] as Map<String, dynamic>),
      cinema: Cinema.fromJson(json['cinema'] as Map<String, dynamic>),
      ticketPrice: (json['ticketPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$$TicketImplToJson(_$TicketImpl instance) =>
    <String, dynamic>{
      'bookingId': instance.bookingId,
      'movie': instance.movie,
      'cinema': instance.cinema,
      'ticketPrice': instance.ticketPrice,
    };
