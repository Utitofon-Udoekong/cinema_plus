
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
class Ticket with _$Ticket {
  const factory Ticket({
    required String bookingId,
    required int movieId,
    required String movieTitle,
    required String moviePoster,
    required DateTime date,
    required String hall,
    required String cinema,
    required String location,
    required String row,
    required List<String> seats,
  }) = _Ticket;

  factory Ticket.empty() => Ticket(
        bookingId: '',
        movieId: 0,
        movieTitle: '',
        moviePoster: '',
        date: DateTime.now(),
        hall: '',
        cinema: '',
        location: '',
        row: '',
        seats: [],
      );

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  // Map<String, dynamic> toJson() => _$TicketToJson(this);

}
