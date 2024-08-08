import 'package:cache/cache.dart';
import 'package:cinema_plus/src/core/router/router.dart';
import 'package:cinema_plus/src/service/firebase_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {

  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get auth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @injectable
  GoogleSignIn get googleSignIn => GoogleSignIn.standard();

  @injectable
  CacheClient get cache => CacheClient();

  @injectable
  AppRouter get appRouter => AppRouter();

}