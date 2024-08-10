// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cinema_plus/src/models/movie/cast/cast.dart';
import 'package:flutter/foundation.dart';

class Filmography {
  List<Cast> cast;
  int id;
  Filmography({
    required this.cast,
    required this.id,
  });

}

// class Cast {
//   bool adult;
//   String backdropPath;
//   List<int> genreIds;
//   int id;
//   String originalLanguage;
//   String originalTitle;
//   String overview;
//   double popularity;
//   String posterPath;
//   String releaseDate;
//   String title;
//   bool video;
//   double voteAverage;
//   int voteCount;
//   String character;
//   String creditId;
//   int order;
//   Cast({
//     required this.adult,
//     required this.backdropPath,
//     required this.genreIds,
//     required this.id,
//     required this.originalLanguage,
//     required this.originalTitle,
//     required this.overview,
//     required this.popularity,
//     required this.posterPath,
//     required this.releaseDate,
//     required this.title,
//     required this.video,
//     required this.voteAverage,
//     required this.voteCount,
//     required this.character,
//     required this.creditId,
//     required this.order,
//   });

  

//   Cast copyWith({
//     bool? adult,
//     String? backdropPath,
//     List<int>? genreIds,
//     int? id,
//     String? originalLanguage,
//     String? originalTitle,
//     String? overview,
//     double? popularity,
//     String? posterPath,
//     String? releaseDate,
//     String? title,
//     bool? video,
//     double? voteAverage,
//     int? voteCount,
//     String? character,
//     String? creditId,
//     int? order,
//   }) {
//     return Cast(
//       adult: adult ?? this.adult,
//       backdropPath: backdropPath ?? this.backdropPath,
//       genreIds: genreIds ?? this.genreIds,
//       id: id ?? this.id,
//       originalLanguage: originalLanguage ?? this.originalLanguage,
//       originalTitle: originalTitle ?? this.originalTitle,
//       overview: overview ?? this.overview,
//       popularity: popularity ?? this.popularity,
//       posterPath: posterPath ?? this.posterPath,
//       releaseDate: releaseDate ?? this.releaseDate,
//       title: title ?? this.title,
//       video: video ?? this.video,
//       voteAverage: voteAverage ?? this.voteAverage,
//       voteCount: voteCount ?? this.voteCount,
//       character: character ?? this.character,
//       creditId: creditId ?? this.creditId,
//       order: order ?? this.order,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'adult': adult,
//       'backdropPath': backdropPath,
//       'genreIds': genreIds,
//       'id': id,
//       'originalLanguage': originalLanguage,
//       'originalTitle': originalTitle,
//       'overview': overview,
//       'popularity': popularity,
//       'posterPath': posterPath,
//       'releaseDate': releaseDate,
//       'title': title,
//       'video': video,
//       'voteAverage': voteAverage,
//       'voteCount': voteCount,
//       'character': character,
//       'creditId': creditId,
//       'order': order,
//     };
//   }

//   factory Cast.fromMap(Map<String, dynamic> map) {
//     return Cast(
//       adult: map['adult'] as bool,
//       backdropPath: map['backdropPath'] as String,
//       genreIds: List<int>.from((map['genreIds'] as List<int>)),
//       id: map['id'] as int,
//       originalLanguage: map['originalLanguage'] as String,
//       originalTitle: map['originalTitle'] as String,
//       overview: map['overview'] as String,
//       popularity: map['popularity'] as double,
//       posterPath: map['posterPath'] as String,
//       releaseDate: map['releaseDate'] as String,
//       title: map['title'] as String,
//       video: map['video'] as bool,
//       voteAverage: map['voteAverage'] as double,
//       voteCount: map['voteCount'] as int,
//       character: map['character'] as String,
//       creditId: map['creditId'] as String,
//       order: map['order'] as int,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Cast.fromJson(String source) => Cast.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'Cast(adult: $adult, backdropPath: $backdropPath, genreIds: $genreIds, id: $id, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount, character: $character, creditId: $creditId, order: $order)';
//   }

//   @override
//   bool operator ==(covariant Cast other) {
//     if (identical(this, other)) return true;
  
//     return 
//       other.adult == adult &&
//       other.backdropPath == backdropPath &&
//       listEquals(other.genreIds, genreIds) &&
//       other.id == id &&
//       other.originalLanguage == originalLanguage &&
//       other.originalTitle == originalTitle &&
//       other.overview == overview &&
//       other.popularity == popularity &&
//       other.posterPath == posterPath &&
//       other.releaseDate == releaseDate &&
//       other.title == title &&
//       other.video == video &&
//       other.voteAverage == voteAverage &&
//       other.voteCount == voteCount &&
//       other.character == character &&
//       other.creditId == creditId &&
//       other.order == order;
//   }

//   @override
//   int get hashCode {
//     return adult.hashCode ^
//       backdropPath.hashCode ^
//       genreIds.hashCode ^
//       id.hashCode ^
//       originalLanguage.hashCode ^
//       originalTitle.hashCode ^
//       overview.hashCode ^
//       popularity.hashCode ^
//       posterPath.hashCode ^
//       releaseDate.hashCode ^
//       title.hashCode ^
//       video.hashCode ^
//       voteAverage.hashCode ^
//       voteCount.hashCode ^
//       character.hashCode ^
//       creditId.hashCode ^
//       order.hashCode;
//   }
// }

