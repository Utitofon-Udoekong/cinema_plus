import 'package:cinema_plus/src/constants/constants.dart';
// import 'package:cinema_plus/src/core/bloc_observer.dart';
import 'package:cinema_plus/src/core/firebase_helpers.dart';
import 'package:cinema_plus/src/domain/exceptions.dart';
import 'package:cinema_plus/src/domain/local/movie_cache.dart';
import 'package:cinema_plus/src/models/models.dart' show Movie, Cast, Actor;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MovieRepository {
  final Dio _dio;
  final FirebaseFirestore _firebaseFirestore;
  final FirebaseAuth _firebaseAuth;
  final MovieCache _movieCache;

  MovieRepository(
      this._dio, this._firebaseFirestore, this._firebaseAuth, this._movieCache);

  Future<List<Movie>> getMovies(MovieListType listType, int page) async {
    bool shouldFetch = await _movieCache.shouldFetchFromServer(listType);
    if (shouldFetch) {
      try {
        final response = await _dio.get(
            '${AppStrings.baseURL}${getUrlFromMovieListType(listType)}?include_adult=false&include_video=false&language=en-US&page=$page&sort_by=popularity.desc');
        final moviesData = response.data;
        List<Movie> movieList = [];
        final serverMovieList = moviesData['results'];
        for (var i = 0; i < serverMovieList.length; i++) {
          final movie = Movie.fromJson(serverMovieList[i]);
          movieList.add(movie);
        }
        await _movieCache.cacheMovies(movieList, listType, page,
            moviesData['total_pages'], moviesData['total_results']);
        await _movieCache.updateLastFetchTime(listType);
        return movieList;
      } on DioException catch (e) {
        throw CPException.dio(e);
      }
      // Fetch from API and cache
    }

    // Try to get from cache
    final cachedMovies =
        await _movieCache.getCachedMovies(listType, page: page);
    if (cachedMovies.isNotEmpty) {
      return cachedMovies;
    }

    // If not in cache (shouldn't happen normally, but just in case), fetch from API
    final response = await _dio.get(
        '${AppStrings.baseURL}${getUrlFromMovieListType(listType)}?include_adult=false&include_video=false&language=en-US&page=$page&sort_by=popularity.desc');
    final moviesData = response.data;
    List<Movie> movieList = [];
    final serverMovieList = moviesData['results'];
    for (var i = 0; i < serverMovieList.length; i++) {
      final movie = Movie.fromJson(serverMovieList[i]);
      movieList.add(movie);
    }
    await _movieCache.cacheMovies(movieList, listType, page,
        moviesData['totalPages'], moviesData['totalResults']);
    await _movieCache.updateLastFetchTime(listType);
    return movieList;
  }

  Future<List<Movie>> searchMovie({required String query}) async {
    try {
      final response =
          await _dio.get('${AppStrings.baseURL}/search/movie?query=$query');
      final data = response.data;
      List<Movie> movieList = [];
      final serverMovieList = data['results'];
      for (var i = 0; i < serverMovieList.length; i++) {
        final movie = Movie.fromJson(serverMovieList[i]);
        movieList.add(movie);
      }
      return movieList;
    } on DioException catch (e) {
      throw CPException.dio(e);
    }
  }

  Future<List<Cast>> getMovieCast({required int movieId}) async {
    final cachedCast = await _movieCache.getCachedCast(movieId);
    if (cachedCast.isNotEmpty) {
      return cachedCast;
    }
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
      await _movieCache.cacheCast(movieId, castList);
      return castList;
    } on DioException {
      rethrow;
    }
  }

  Future<Actor> getActor({required int actorId}) async {
    final cachedActor = await _movieCache.getCachedActor(actorId);
    if (cachedActor != null) {
      return cachedActor;
    }
    try {
      final response = await _dio.get(
          '${AppStrings.baseURL}/person/$actorId?append_to_response=movie_credits,images&language=en-US');
      final actor = Actor.fromJson(response.data);
      await _movieCache.cacheActor(actor);
      return actor;
    } on DioException catch (e) {
      throw CPException.dio(e);
    }
  }

  Stream<QuerySnapshot<Movie>> getFavorites() {
    return _firebaseFirestore.userCollection
        .doc(_firebaseAuth.currentUser!.uid)
        .favoritesCollection
        .withConverter(
            fromFirestore: Movie.fromFirestore,
            toFirestore: (Movie movie, options) => Movie.toFirestore(movie))
        .snapshots();
  }

  void addToFavorites({required Movie movie}) async {
    try {
      final docRef = _firebaseFirestore.userCollection
          .doc(_firebaseAuth.currentUser!.uid)
          .favoritesCollection
          .withConverter(
              fromFirestore: Movie.fromFirestore,
              toFirestore: (Movie movie, options) => Movie.toFirestore(movie))
          .doc(movie.id.toString());
      await docRef.set(movie);
    } on FirebaseException catch (e) {
      throw CPException.firestore(e);
    }
  }

  void removeFromFavorites({required String movieID}) async {
    try {
      final docRef = _firebaseFirestore.userCollection
          .doc(_firebaseAuth.currentUser!.uid)
          .favoritesCollection
          .doc(movieID);
      await docRef.delete();
    } on FirebaseException catch (e) {
      throw CPException.firestore(e);
    }
  }
}
