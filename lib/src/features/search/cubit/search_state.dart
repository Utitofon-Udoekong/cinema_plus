part of 'search_cubit.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState(
      {required bool isLoading,
      required List<Movie> searchResult,
      required Movie selectedMovie,
      required String? errorMessage}) = _SearchState;

  factory SearchState.initial() => SearchState(
        isLoading: false,
        searchResult: [],
        selectedMovie: Movie.empty(),
        errorMessage: null,
      );
}
