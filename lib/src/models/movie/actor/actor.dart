import 'package:cinema_plus/src/models/movie/cast/cast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'actor.freezed.dart';
part 'actor.g.dart';

@freezed
class Actor with _$Actor {
  const factory Actor({
    required bool adult,
    @JsonKey(name: 'also_known_as') required List<String> alsoKnownAs,
    required String biography,
    required String birthday,
    required String? deathday,
    required int gender,
    required String? homepage,
    required int id,
    @JsonKey(name: 'imdb_id') required String imdbId,
    @JsonKey(name: 'known_for_department') required String knownForDepartment,
    required String name,
    @JsonKey(name: 'place_of_birth') required String placeOfBirth,
    required double popularity,
    @JsonKey(name: 'profile_path') required String profilePath,
    @JsonKey(name: 'movie_credits') required MovieCredits? movieCredits,
    required Images? images,
  }) = _Actor;

  factory Actor.fromJson(Map<String, dynamic> json) => _$ActorFromJson(json);

  factory Actor.empty() => Actor(
      adult: false,
      alsoKnownAs: [],
      biography: '',
      birthday: '',
      deathday: '',
      gender: 0,
      homepage: '',
      id: 0,
      imdbId: '',
      knownForDepartment: '',
      name: '',
      placeOfBirth: '',
      popularity: 0,
      profilePath: 'profilePath', movieCredits: null, images: null,
      );
}

@freezed
class MovieCredits with _$MovieCredits {
  const factory MovieCredits({required List<Cast> cast}) = _MovieCredits;

  factory MovieCredits.fromJson(Map<String, dynamic> json) =>
      _$MovieCreditsFromJson(json);
}

@freezed
class Images with _$Images {
  const factory Images({required List<Profiles> profiles}) = _Images;

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

  // Make sure to run 'flutter pub run build_runner build' after adding this method.

  // factory Images.fromJson(Map<String, dynamic> json) {
  //   List<Profiles> profiles = [];
  //   if (json['profiles'] != null) {
  //     json['profiles'].forEach((v) {
  //       profiles.add(Profiles.fromJson(v));
  //     });
  //   }
  //   return Images(profiles: profiles);
  // }
}

@freezed
class Profiles with _$Profiles {
  const factory Profiles({
    @JsonKey(name: 'aspect_ratio') required double aspectRatio,
    required int height,
    @JsonKey(name: 'file_path') required String filePath,
    required int width,
  }) = _Profiles;

  factory Profiles.fromJson(Map<String, dynamic> json) =>
      _$ProfilesFromJson(json);

  // Make sure to run 'flutter pub run build_runner build' after adding this method.

  // factory Profiles.fromJson(Map<String, dynamic> json) {
  //   final aspectRatio = json['aspect_ratio'];
  //   final height = json['height'];
  //   final filePath = json['file_path'];
  //   final width = json['width'];
  //   return Profiles(
  //       aspectRatio: aspectRatio,
  //       height: height,
  //       filePath: filePath,
  //       width: width);
  // }
}
