import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:cinema_plus/src/domain/exceptions.dart';
import 'package:cinema_plus/src/domain/repository/movie_repository.dart';
import 'package:cinema_plus/src/models/models.dart';

part 'favourite_cubit.freezed.dart';
part 'favourite_state.dart';

@lazySingleton
class FavouriteCubit extends Cubit<FavouriteState> {
  StreamSubscription<QuerySnapshot<Movie>>? _favoritesSubscription;
  final MovieRepository _movieRepository;

  FavouriteCubit(this._movieRepository) : super(FavouriteState.initial()) {
    _favoritesSubscription = _movieRepository
        .getFavorites()
        .listen(_subscribeToFavorites, onError: (e) => fail(e));
  }

  void addToFavorites(Movie movie) {
    try {
      _movieRepository.addToFavorites(movie: movie);
    } on CPException catch (e) {
      fail(e.message);
    }
  }

  void removeFromFavorites(String movieID) {
    try {
      _movieRepository.removeFromFavorites(movieID: movieID);
    } on CPException catch (e) {
      fail(e.message);
    }
  }

  _subscribeToFavorites(QuerySnapshot<Movie>? snapshot) {
    if (snapshot != null) {
      emit(state.copyWith(
          favoriteMovies: snapshot.docs.map((movie) => movie.data()).toList()));
    }
  }

  @override
  Future<void> close() {
    _favoritesSubscription?.cancel();
    return super.close();
  }

  void load() => emit(state.copyWith(isLoading: true));
  void fail(String message) => emit(state.copyWith(isLoading: false, failure: message));
  // void pass(String message) => emit(state.copyWith(isLoading: false, failure: message));
}
