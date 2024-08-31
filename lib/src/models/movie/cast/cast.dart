// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cast.freezed.dart';
part 'cast.g.dart';

@freezed
class Cast with _$Cast {
  const factory Cast({
    required bool adult,
    int? gender,
    required int id,
    @JsonKey(name: "known_for_department") required String knownForDepartment,
    required String name,
    @JsonKey(name: "original_name") required String originalName,
    required double popularity,
    @JsonKey(name: "profile_path") String? profilePath,
    @JsonKey(name: "cast_id") required int castId,
    required String character,
    @JsonKey(name: "credit_id") required String creditId,
  }) = _Cast;

  factory Cast.empty() => const Cast(
        adult: false,
        gender: 0,
        id: 0,
        knownForDepartment: '',
        name: '',
        originalName: '',
        popularity: 0,
        profilePath: '',
        castId: 0,
        character: '',
        creditId: '',
      );

  factory Cast.fromJson(Map<String, dynamic> json) => _$CastFromJson(json);

  // Make sure to run 'flutter pub run build_runner build' after adding this method.
}
