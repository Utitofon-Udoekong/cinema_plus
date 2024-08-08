import 'package:cinema_plus/src/models/movie/genre.dart';
import 'package:cinema_plus/src/models/movie/production_companies.dart';
import 'package:cinema_plus/src/models/movie/production_countries.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';
part 'movie.g.dart';

@freezed
class Movie with _$Movie {
  factory Movie({
    required bool adult,
    required String backdropPath,
    required int budget,
    required List<Genres> genres,
    required String homepage,
    required int id,
    String? imdbId,
    required String originalTitle,
    required String overview,
    required double popularity,
    required String posterPath,
    required List<ProductionCompanies> productionCompanies,
    required List<ProductionCountries> productionCountries,
    required String releaseDate,
    required int revenue,
    required int runtime,
    required String status,
    required String tagline,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) = _Movie;

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  factory Movie.empty() => Movie(
        adult: false,
        backdropPath: '',
        budget: 0,
        genres: [],
        homepage: '',
        id: 0,
        imdbId: '',
        originalTitle: '',
        overview: '',
        popularity: 0,
        posterPath: '',
        productionCompanies: [],
        productionCountries: [],
        releaseDate: '',
        revenue: 0,
        runtime: 0,
        status: '',
        tagline: '',
        title: '',
        video: false,
        voteAverage: 0,
        voteCount: 0,
      );
}
