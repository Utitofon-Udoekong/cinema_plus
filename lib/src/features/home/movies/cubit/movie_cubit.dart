import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema_plus/src/domain/repository/movie_repository.dart';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'movie_state.dart';
part 'movie_cubit.freezed.dart';

@lazySingleton
class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this._movieRepository) : super(MovieState.initial()) {
    discoverMovies();
    getNowPlayingMovies();
    getUpcomingMovies();
  }

  final MovieRepository _movieRepository;

  Future<bool> discoverMovies([int page = 1]) async {
    loadDiscover();
    try {
      final movies = await _movieRepository.getMovies(MovieListType.discover, page);
      emit(state.copyWith(discoverMovies: movies, isDiscoverLoading: false));
      return true;
    } on DioException catch (e) {
      failDiscover(e.message!);
      return false;
    }
  }

  Future<bool> getUpcomingMovies([int page = 1]) async {
    loadUpcoming();
    try {
      final movies = await _movieRepository.getMovies(MovieListType.upcoming, page);
      emit(state.copyWith(upcomingMovies: movies, isUpcomingLoading: false));
      return true;
    } on DioException catch (e) {
      failUpcoming(e.message!);
      return false;
    }
  }

  Future<bool> getNowPlayingMovies([int page = 1]) async {
    loadNowPlaying();
    try {
      final movies = await _movieRepository.getMovies(MovieListType.nowPlaying, page);
      emit(state.copyWith(nowPlaying: movies, isNowPlayingLoading: false));
      return true;
    } on DioException catch (e) {
      failNowPlaying(e.message!);
      return false;
    }
  }

  getMovieCast(int id) async {
    loadCast();
    try {
      final movieCast = await _movieRepository.getMovieCast(movieId: id);
      emit(state.copyWith(movieCast: movieCast, isCastLoading: false));
    } on DioException catch (e) {
      emit(state.copyWith(isCastLoading: false, errorMessage: e.message));
    }
  }

  void selectMovie(Movie movie) => emit(state.copyWith(selectedMovie: movie));

  Future<void> getActor(int id) async {
    loadCast();
    try {
      final actor = await _movieRepository.getActor(actorId: id);
      emit(state.copyWith(selectedActor: actor, isCastLoading: false));
    } on DioException catch (e) {
      emit(state.copyWith(isCastLoading: false, errorMessage: e.message));
    }
  }

  void loadDiscover() => emit(state.copyWith(isDiscoverLoading: true));
  void loadNowPlaying() => emit(state.copyWith(isNowPlayingLoading: true));
  void loadUpcoming() => emit(state.copyWith(isUpcomingLoading: true));
  void loadCast() => emit(state.copyWith(isCastLoading: true));

  void failDiscover(String message) =>
      emit(state.copyWith(isDiscoverLoading: false, errorMessage: message));
  void failNowPlaying(String message) =>
      emit(state.copyWith(isNowPlayingLoading: true, errorMessage: message));
  void failUpcoming(String message) =>
      emit(state.copyWith(isUpcomingLoading: true, errorMessage: message));
}
