
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cinema.dart';
import 'movie/movie.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    required String bookingId,
    required Movie movie,
    required Cinema cinema,
  }) = _Ticket;

  factory Ticket.empty() => Ticket(
        bookingId: '',
        cinema: Cinema.empty(),
        movie: Movie.empty()
      );

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  // Map<String, dynamic> toJson() => _$TicketToJson(this);

}
