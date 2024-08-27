// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'cinema.dart';
import 'movie/movie.dart';

part 'ticket.freezed.dart';
part 'ticket.g.dart';

@freezed
abstract class Ticket with _$Ticket {
  const factory Ticket(
      {required String bookingId,
      required Movie movie,
      required Cinema cinema,
      required double ticketPrice}) = _Ticket;

  factory Ticket.empty() => Ticket(
      bookingId: '',
      cinema: Cinema.empty(),
      movie: Movie.empty(),
      ticketPrice: 0.0);

  factory Ticket.fromJson(Map<String, dynamic> json) => _$TicketFromJson(json);

  factory Ticket.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Ticket(
      bookingId: data['bookingId'],
      movie: Movie.fromFirestoreJson(data['movie']),
      cinema: Cinema.fromFirestoreJson(data['cinema']),
      ticketPrice: data['ticketPrice'],
    );
  }

  static Map<String, dynamic> toFirestore(Ticket ticket) {
    return {
      "bookingId": ticket.bookingId,
      "movie": Movie.toFirestore(ticket.movie),
      "cinema": Cinema.toFirestore(ticket.cinema),
      "ticketPrice": ticket.ticketPrice,
    };
  }
}
