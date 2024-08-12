import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/core/bloc_observer.dart';
import 'package:cinema_plus/src/core/firebase_helpers.dart';
import 'package:cinema_plus/src/models/models.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieRepository {
  final Dio _dio;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;

  MovieRepository(this._dio, this._firebaseFirestore, this._firebaseAuth);

  Future<List<Movie>> discoverMovies() async {
    try {
      final response = await _dio.get(
          '${AppStrings.baseURL}/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
      final data = response.data;
      List<Movie> movieList = [];
      final serverMovieList = data['results'];
      for (var i = 0; i < serverMovieList.length; i++) {
        final movie = Movie.fromJson(serverMovieList[i]);
        movieList.add(movie);
      }
      return movieList;
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    }
  }

  Future<List<Movie>> nowPlaying() async {
    try {
      final response = await _dio.get(
          '${AppStrings.baseURL}/movie/now_playing?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
      final data = response.data;
      logger.w(data);
      List<Movie> movieList = [];
      final serverMovieList = data['results'];
      for (var i = 0; i < serverMovieList.length; i++) {
        final movie = Movie.fromJson(serverMovieList[i]);
        movieList.add(movie);
      }
      return movieList;
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    }
  }

  Future<List<Movie>> upcomingMovies() async {
    try {
      final response = await _dio.get(
          '${AppStrings.baseURL}/movie/upcoming?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc');
      final data = response.data;
      logger.w(data);
      List<Movie> movieList = [];
      final serverMovieList = data['results'];
      for (var i = 0; i < serverMovieList.length; i++) {
        final movie = Movie.fromJson(serverMovieList[i]);
        movieList.add(movie);
      }
      return movieList;
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    }
  }

  Future<List<Movie>> searchMovie({required String query}) async {
    try {
      final response =
          await _dio.get('${AppStrings.baseURL}/search/movie?query=$query');
      logger.w(response.data);
      throw UnimplementedError();
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    }
  }

  Future<Movie> getMovie({required String movieId}) async {
    try {
      final response = await _dio.get('${AppStrings.baseURL}/movie/$movieId');
      logger.w(response.data);
      throw UnimplementedError();
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    }
  }

  Future<List<Cast>> getMovieCast({required int movieId}) async {
    try {
      final response =
          await _dio.get('${AppStrings.baseURL}/movie/$movieId/credits');
      final data = response.data;
      List<Cast> castList = [];
      final serverCastList = data['cast'];
      for (var i = 0; i < serverCastList.length; i++) {
        final cast = Cast.fromJson(serverCastList[i]);
        castList.add(cast);
      }
      return castList;
    } on DioException {
      rethrow;
    }
  }

  Future<List<Clip>> getMovieClips({required String movieId}) async {
    throw UnimplementedError();
    // try {
    //   final response = await _dio.get('${AppStrings.baseURL}/movie/$movieId/videos');
    //   logger.w(response.data);
    // } on DioException {
    //   rethrow;
    // }
  }

  Future<Actor> getActor({required int actorId}) async {
    try {
      final response = await _dio.get(
          '${AppStrings.baseURL}/person/$actorId?append_to_response=movie_credits,images&language=en-US');
      logger.w(response.data);
      return Actor.fromJson(response.data);
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    }
  }

  Future<List<Movie>> getActorFilmography({required String actorId}) async {
    try {
      final response = await _dio.get(
          '${AppStrings.baseURL}/person/$actorId/movie_credits?language=en-US');
      logger.w(response.data);
      final data = response.data;
      List<Movie> movieList = [];
      final serverMovieList = data['results'];
      for (var i = 0; i < serverMovieList.length; i++) {
        final movie = Movie.fromJson(serverMovieList[i]);
        movieList.add(movie);
      }
      return movieList;
    } on DioException catch (e) {
      throw DioException(requestOptions: e.requestOptions);
    }
  }

  // Stream<Movie> getFavorites({required Movie movie}) {
  //   final Stream<DocumentSnapshot> snapshots = _firebaseFirestore.userCollection
  //       .doc(_firebaseAuth.currentUser!.uid)
  //       .snapshots();
  //   return snapshots.map((doc) => Movie.fromFirestore(doc as DocumentSnapshot<Map<String, dynamic>>));
  // }

  Future<void> addToFavorites({required Movie movie}) async {
    await _firebaseFirestore.userCollection
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      "favourites": FieldValue.arrayUnion([movie])
    });
  }

  Future<void> removeFromFavorites({required Movie movie}) async {
    await _firebaseFirestore.userCollection
        .doc(_firebaseAuth.currentUser!.uid)
        .update({
      "favourites": FieldValue.arrayRemove([movie])
    });
  }
}
