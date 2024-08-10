// import 'package:cinema_plus/src/models/movie/genre.dart';
// import 'package:cinema_plus/src/models/movie/production_companies.dart';
// import 'package:cinema_plus/src/models/movie/production_countries.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
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
    @JsonKey(name: 'release_date')required String releaseDate,
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

  // factory Movie.fromFirestore(
  //   DocumentSnapshot<Map<String, dynamic>> snapshot,
  // ) {
  //   final data = snapshot.data();
  //   return Movie(
  //     adult = data?['adult'];
  //     backdropPath = data?['backdrop_path'];
  //     genreIds = data?['genre_ids'].cast<int>();
  //     id = data?['id'];
  //     originalLanguage = data?['original_language'];
  //     originalTitle = data?['original_title'];
  //     overview = data?['overview'];
  //     popularity = data?['popularity'];
  //     posterPath = data?['poster_path'];
  //     releaseDate = data?['release_date'];
  //     title = data?['title'];
  //     video = data?['video'];
  //     voteAverage = data?['vote_average'];
  //     voteCount = data?['vote_count'];
  //   );
  // }
}
