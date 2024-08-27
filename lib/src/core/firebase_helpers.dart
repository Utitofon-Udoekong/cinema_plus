import 'package:cinema_plus/src/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseFirestoreCollections on FirebaseFirestore {
  CollectionReference get userCollection => collection("users");
}

extension DocumentCollections on DocumentReference {
  CollectionReference get favoritesCollection => collection("favorites");
  CollectionReference get ticketsCollection => collection("tickets");
  CollectionReference get cardsCollection => collection("cards");
}

extension FirebaseUserX on User {
  AppUser toDomain() {
    final appUser = AppUser.empty();
    return appUser.copyWith(uid: uid, email: email!);
  }
}