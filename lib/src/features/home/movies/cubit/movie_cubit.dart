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

  discoverMovies() async {
    loadDiscover();
    try {
      final movies = await _movieRepository.discoverMovies();
      emit(state.copyWith(discoverMovies: movies, isDiscoverLoading: false));
    } on DioException catch (e) {
      failDiscover(e.message!);
    }
  }

  getUpcomingMovies() async {
    loadUpcoming();
    try {
      final movies = await _movieRepository.upcomingMovies();
      emit(state.copyWith(upcomingMovies: movies, isUpcomingLoading: false));
    } on DioException catch (e) {
      failUpcoming(e.message!);
    }
  }

  getNowPlayingMovies() async {
    loadNowPlaying();
    try {
      final movies = await _movieRepository.nowPlaying();
      emit(state.copyWith(nowPlaying: movies, isNowPlayingLoading: false));
    } on DioException catch (e) {
      failNowPlaying(e.message!);
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
