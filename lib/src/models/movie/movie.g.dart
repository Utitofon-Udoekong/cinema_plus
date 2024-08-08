// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MovieImpl _$$MovieImplFromJson(Map<String, dynamic> json) => _$MovieImpl(
      adult: json['adult'] as bool,
      backdropPath: json['backdropPath'] as String,
      budget: (json['budget'] as num).toInt(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Genres.fromJson(e as String))
          .toList(),
      homepage: json['homepage'] as String,
      id: (json['id'] as num).toInt(),
      imdbId: json['imdbId'] as String?,
      originalTitle: json['originalTitle'] as String,
      overview: json['overview'] as String,
      popularity: (json['popularity'] as num).toDouble(),
      posterPath: json['posterPath'] as String,
      productionCompanies: (json['productionCompanies'] as List<dynamic>)
          .map((e) => ProductionCompanies.fromJson(e as String))
          .toList(),
      productionCountries: (json['productionCountries'] as List<dynamic>)
          .map((e) => ProductionCountries.fromJson(e as String))
          .toList(),
      releaseDate: json['releaseDate'] as String,
      revenue: (json['revenue'] as num).toInt(),
      runtime: (json['runtime'] as num).toInt(),
      status: json['status'] as String,
      tagline: json['tagline'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: (json['voteAverage'] as num).toDouble(),
      voteCount: (json['voteCount'] as num).toInt(),
    );

Map<String, dynamic> _$$MovieImplToJson(_$MovieImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdropPath': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'imdbId': instance.imdbId,
      'originalTitle': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'posterPath': instance.posterPath,
      'productionCompanies': instance.productionCompanies,
      'productionCountries': instance.productionCountries,
      'releaseDate': instance.releaseDate,
      'revenue': instance.revenue,
      'runtime': instance.runtime,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'video': instance.video,
      'voteAverage': instance.voteAverage,
      'voteCount': instance.voteCount,
    };
