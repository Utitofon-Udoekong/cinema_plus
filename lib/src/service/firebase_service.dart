import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  // We use a static function because we won't be able to receive access it in a static method
  // static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static String token = "";


  static Future<FirebaseService> init() async {
    await Firebase.initializeApp();
    // await FirebaseService._firestore.app
    return FirebaseService();
  }
}