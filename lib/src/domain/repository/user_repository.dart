import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:cinema_plus/src/domain/exceptions.dart';

import 'package:cinema_plus/src/core/firebase_helpers.dart';
import 'package:cinema_plus/src/models/models.dart' show CreditCard;

@lazySingleton
class UserRepository {
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  UserRepository(this._firebaseFirestore, this._firebaseAuth);

  Stream<QuerySnapshot<CreditCard>> getCreditCards() {
    return _firebaseFirestore.userCollection
        .doc(_firebaseAuth.currentUser!.uid)
        .cardsCollection
        .withConverter(
            fromFirestore: CreditCard.fromFirestore,
            toFirestore: (CreditCard creditCard, options) =>
                CreditCard.toFirestore(creditCard))
        .snapshots();
  }

  Future<void> addCard({required CreditCard card}) async {
    final docRef = _firebaseFirestore.userCollection
        .doc(_firebaseAuth.currentUser!.uid)
        .cardsCollection
        .withConverter(
            fromFirestore: CreditCard.fromFirestore,
            toFirestore: (CreditCard creditCard, options) =>
                CreditCard.toFirestore(creditCard))
        .doc(card.id);
    try {
      await docRef.set(card);
    } on FirebaseException catch (e) {
      throw CPException.firestore(e);
    }
  }

  Future<void> removeCard({required String cardID}) async {
    final docRef = _firebaseFirestore.userCollection
        .doc(_firebaseAuth.currentUser!.uid)
        .cardsCollection
        .doc(cardID);
    try {
      await docRef.delete();
    } on FirebaseException catch (e) {
      throw CPException.firestore(e);
    }
  }
}
