part of 'favourite_cubit.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState({
    required List<Movie> favoriteMovies,
    required bool isLoading,
    required String failure,
  }) = _FavouriteState;

  factory FavouriteState.initial() => FavouriteState(
        favoriteMovies: [],
        isLoading: false,
        failure: ''
      );
}
