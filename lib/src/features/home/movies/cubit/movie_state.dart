part of 'movie_cubit.dart';

@freezed
class MovieState with _$MovieState {
  const factory MovieState(
      {required bool isDiscoverLoading,
      required bool isNowPlayingLoading,
      required bool isUpcomingLoading,
      required bool isCastLoading,
      required List<Cast> movieCast,
      required List<Movie> discoverMovies,
      required List<Movie> nowPlaying,
      required List<Movie> upcomingMovies,
      required Actor selectedActor,
      required String? errorMessage}) = _Movie;

  factory MovieState.initial() => MovieState(
        isDiscoverLoading: false,
        isNowPlayingLoading: false,
        isUpcomingLoading: false,
        isCastLoading: false,
        discoverMovies: [],
        nowPlaying: [],
        upcomingMovies: [],
        movieCast: [],
        errorMessage: null,
        selectedActor: Actor.empty()
      );
}
