import 'dart:async';

import 'package:cinema_plus/src/core/bloc_observer.dart';
import 'package:cinema_plus/src/domain/exceptions.dart';
import 'package:cinema_plus/src/domain/repository/movie_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'favourite_state.dart';
part 'favourite_cubit.freezed.dart';

@lazySingleton
class FavouriteCubit extends Cubit<FavouriteState> {
  StreamSubscription<QuerySnapshot<Movie>>? _favoritesSubscription;
  final MovieRepository _movieRepository;

  FavouriteCubit(this._movieRepository) : super(FavouriteState.initial()) {
    _favoritesSubscription = _movieRepository
        .getFavorites()
        .listen(_subscribeToFavorites, onError: (e) => print(e));
  }

  void addToFavorites(Movie movie) async {
    try {
      final isDone = await _movieRepository.addToFavorites(movie: movie);
      print(isDone);
    } on CPException catch (e) {
      print(e.message);
    }
  }

  void removeFromFavorites(String movieID) async {
    try {
      await _movieRepository.removeFromFavorites(movieID: movieID);
    } on CPException catch (e) {
      print(e.message);
    }
  }

  _subscribeToFavorites(QuerySnapshot<Movie>? snapshot) {
    if(snapshot != null){
      logger.w(snapshot.docs.map((movie) => movie.data()).toList());
      emit(state.copyWith(favoriteMovies: snapshot.docs.map((movie) => movie.data()).toList()));
    }
  }

  @override
  Future<void> close() {
    _favoritesSubscription?.cancel();
    return super.close();
  }
}
