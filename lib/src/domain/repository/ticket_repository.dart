import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:cinema_plus/src/domain/exceptions.dart';

import 'package:cinema_plus/src/core/firebase_helpers.dart';
import 'package:cinema_plus/src/models/models.dart' show Ticket;

@lazySingleton
class TicketRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  TicketRepository(this._firebaseFirestore, this._firebaseAuth);

  Stream<QuerySnapshot<Ticket>> getTickets() {
    return _firebaseFirestore.userCollection
        .doc(_firebaseAuth.currentUser!.uid)
        .ticketsCollection
        .withConverter(
            fromFirestore: Ticket.fromFirestore,
            toFirestore: (Ticket ticket, options) => Ticket.toFirestore(ticket))
        .snapshots();
  }

  Future<bool> addTicket({required Ticket ticket}) async {
    final docRef = _firebaseFirestore.userCollection
        .doc(_firebaseAuth.currentUser!.uid)
        .ticketsCollection
        .withConverter(
            fromFirestore: Ticket.fromFirestore,
            toFirestore: (Ticket ticket, options) => Ticket.toFirestore(ticket))
        .doc(ticket.bookingId);
    try {
      await docRef.set(ticket);
      return true;
    } on FirebaseException catch (e) {
      throw CPException.firestore(e);
    }
  }

  Future<bool> removeTicket({required String bookingID}) async {
    final docRef = _firebaseFirestore.userCollection
        .doc(_firebaseAuth.currentUser!.uid)
        .ticketsCollection
        .doc(bookingID);
    try {
      await docRef.delete();
      return true;
    } on FirebaseException catch (e) {
      throw CPException.firestore(e);
    }
  }
}
