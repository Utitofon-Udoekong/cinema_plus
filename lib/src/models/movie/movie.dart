// import 'package:cinema_plus/src/models/movie/genre.dart';
// import 'package:cinema_plus/src/models/movie/production_companies.dart';
// import 'package:cinema_plus/src/models/movie/production_countries.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    required bool adult,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
    required int id,
    @JsonKey(name: 'original_language') required String originalLanguage,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    required double popularity,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    required String title,
    required bool video,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  factory Movie.empty() => Movie(
        adult: false,
        backdropPath: '',
        genreIds: [],
        id: 0,
        originalLanguage: '',
        originalTitle: '',
        overview: '',
        popularity: 0,
        posterPath: '',
        releaseDate: '',
        title: '',
        video: false,
        voteAverage: 0,
        voteCount: 0,
      );

  factory Movie.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data()!;
    return Movie(
      adult: data['adult'],
      backdropPath: data['backdropPath'],
      genreIds: List<int>.from(data['genreIds']),
      id: data['id'],
      originalLanguage: data['originalLanguage'],
      originalTitle: data['originalTitle'],
      overview: data['overview'],
      popularity: data['popularity'],
      posterPath: data['posterPath'],
      releaseDate: data['releaseDate'],
      title: data['title'],
      video: data['video'],
      voteAverage: data['voteAverage'],
      voteCount: data['voteCount'],
    );
  }
  factory Movie.fromFirestoreJson(
    Map<String, dynamic> data,
  ) {
    return Movie(
      adult: data['adult'],
      backdropPath: data['backdropPath'],
      genreIds: List<int>.from(data['genreIds']),
      id: data['id'],
      originalLanguage: data['originalLanguage'],
      originalTitle: data['originalTitle'],
      overview: data['overview'],
      popularity: data['popularity'],
      posterPath: data['posterPath'],
      releaseDate: data['releaseDate'],
      title: data['title'],
      video: data['video'],
      voteAverage: data['voteAverage'],
      voteCount: data['voteCount'],
    );
  }

  static Map<String, dynamic> toFirestore(Movie movie) {
    return {
      "adult": movie.adult,
      if (movie.backdropPath != null) "backdropPath": movie.backdropPath,
      "genreIds": movie.genreIds,
      "id": movie.id,
      "originalLanguage": movie.originalLanguage,
      "originalTitle": movie.originalTitle,
      "overview": movie.overview,
      "popularity": movie.popularity,
      if (movie.posterPath != null) "posterPath": movie.posterPath,
      "releaseDate": movie.releaseDate,
      "title": movie.title,
      "video": movie.video,
      "voteAverage": movie.voteAverage,
      "voteCount": movie.voteCount,
    };
  }
}
