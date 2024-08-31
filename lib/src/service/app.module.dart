import 'package:cache/cache.dart';
import 'package:cinema_plus/src/domain/local/movie_cache.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:cinema_plus/src/service/dio/dio_service.dart';
import 'package:cinema_plus/src/service/firebase_service.dart';

@module
abstract class AppModule {

  @preResolve
  Future<FirebaseService> get firebaseService => FirebaseService.init();

  @injectable
  FirebaseAuth get auth => FirebaseAuth.instance;

  @injectable
  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  @preResolve
  Future<MovieCache> get movieCache => MovieCache.create();

  @injectable
  CacheClient get cache => CacheClient();

  @injectable
  Dio get dio => DioService().getDio();

}