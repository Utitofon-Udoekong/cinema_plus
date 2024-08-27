// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cinema.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Cinema _$CinemaFromJson(Map<String, dynamic> json) {
  return _Cinema.fromJson(json);
}

/// @nodoc
mixin _$Cinema {
  String get name => throw _privateConstructorUsedError;
  set name(String value) => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  set image(String value) => throw _privateConstructorUsedError;
  double get popularity => throw _privateConstructorUsedError;
  set popularity(double value) => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  set location(String value) => throw _privateConstructorUsedError;
  String get hall => throw _privateConstructorUsedError;
  set hall(String value) => throw _privateConstructorUsedError;
  List<String> get seats => throw _privateConstructorUsedError;
  set seats(List<String> value) => throw _privateConstructorUsedError;
  DateTime? get dateTime => throw _privateConstructorUsedError;
  set dateTime(DateTime? value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CinemaCopyWith<Cinema> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CinemaCopyWith<$Res> {
  factory $CinemaCopyWith(Cinema value, $Res Function(Cinema) then) =
      _$CinemaCopyWithImpl<$Res, Cinema>;
  @useResult
  $Res call(
      {String name,
      String image,
      double popularity,
      String location,
      String hall,
      List<String> seats,
      DateTime? dateTime});
}

/// @nodoc
class _$CinemaCopyWithImpl<$Res, $Val extends Cinema>
    implements $CinemaCopyWith<$Res> {
  _$CinemaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? popularity = null,
    Object? location = null,
    Object? hall = null,
    Object? seats = null,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      hall: null == hall
          ? _value.hall
          : hall // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CinemaImplCopyWith<$Res> implements $CinemaCopyWith<$Res> {
  factory _$$CinemaImplCopyWith(
          _$CinemaImpl value, $Res Function(_$CinemaImpl) then) =
      __$$CinemaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String image,
      double popularity,
      String location,
      String hall,
      List<String> seats,
      DateTime? dateTime});
}

/// @nodoc
class __$$CinemaImplCopyWithImpl<$Res>
    extends _$CinemaCopyWithImpl<$Res, _$CinemaImpl>
    implements _$$CinemaImplCopyWith<$Res> {
  __$$CinemaImplCopyWithImpl(
      _$CinemaImpl _value, $Res Function(_$CinemaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? image = null,
    Object? popularity = null,
    Object? location = null,
    Object? hall = null,
    Object? seats = null,
    Object? dateTime = freezed,
  }) {
    return _then(_$CinemaImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      popularity: null == popularity
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as double,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      hall: null == hall
          ? _value.hall
          : hall // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<String>,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CinemaImpl implements _Cinema {
  _$CinemaImpl(
      {required this.name,
      required this.image,
      required this.popularity,
      required this.location,
      required this.hall,
      required this.seats,
      this.dateTime});

  factory _$CinemaImpl.fromJson(Map<String, dynamic> json) =>
      _$$CinemaImplFromJson(json);

  @override
  String name;
  @override
  String image;
  @override
  double popularity;
  @override
  String location;
  @override
  String hall;
  @override
  List<String> seats;
  @override
  DateTime? dateTime;

  @override
  String toString() {
    return 'Cinema(name: $name, image: $image, popularity: $popularity, location: $location, hall: $hall, seats: $seats, dateTime: $dateTime)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CinemaImplCopyWith<_$CinemaImpl> get copyWith =>
      __$$CinemaImplCopyWithImpl<_$CinemaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CinemaImplToJson(
      this,
    );
  }
}

abstract class _Cinema implements Cinema {
  factory _Cinema(
      {required String name,
      required String image,
      required double popularity,
      required String location,
      required String hall,
      required List<String> seats,
      DateTime? dateTime}) = _$CinemaImpl;

  factory _Cinema.fromJson(Map<String, dynamic> json) = _$CinemaImpl.fromJson;

  @override
  String get name;
  set name(String value);
  @override
  String get image;
  set image(String value);
  @override
  double get popularity;
  set popularity(double value);
  @override
  String get location;
  set location(String value);
  @override
  String get hall;
  set hall(String value);
  @override
  List<String> get seats;
  set seats(List<String> value);
  @override
  DateTime? get dateTime;
  set dateTime(DateTime? value);
  @override
  @JsonKey(ignore: true)
  _$$CinemaImplCopyWith<_$CinemaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
