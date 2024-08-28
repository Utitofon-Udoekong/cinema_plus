import 'package:cinema_plus/src/domain/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema_plus/src/domain/repository/movie_repository.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

@lazySingleton
class SearchCubit extends Cubit<SearchState> {
  final MovieRepository _movieRepository;
  SearchCubit(this._movieRepository) : super(SearchState.initial());

  Future<List<Movie>> searchMovie(String query) async {
    load();
    try {
      final result = await _movieRepository.searchMovie(query: query);
      emit(state.copyWith(isLoading: false));
      return result;
    } on CPException catch (e) {
      fail(e.message);
      return [];
    }
  }

  void load() => emit(state.copyWith(isLoading: true, errorMessage: null));
  void fail(String message) =>
      emit(state.copyWith(isLoading: false, errorMessage: message));
}
