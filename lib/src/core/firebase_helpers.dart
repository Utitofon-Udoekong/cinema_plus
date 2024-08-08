import 'package:cinema_plus/src/models/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference get userCollection => collection("users");
  // CollectionReference get kycCollection => collection("kyc");
  // CollectionReference get investmentCollection => collection("investments");
  // CollectionReference get withdrawalCollection => collection("withdrawals");
  // CollectionReference get newsCollection => collection("news");
}

extension FirebaseUserX on User {
  AppUser toDomain() {
    final appUser = AppUser.empty();
    return appUser.copyWith(uid: uid, email: email!);
  }
}