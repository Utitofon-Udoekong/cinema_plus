// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BookingState {
  Cinema get selectedCinema => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  Movie get selectedMovie => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BookingStateCopyWith<BookingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingStateCopyWith<$Res> {
  factory $BookingStateCopyWith(
          BookingState value, $Res Function(BookingState) then) =
      _$BookingStateCopyWithImpl<$Res, BookingState>;
  @useResult
  $Res call({Cinema selectedCinema, bool isLoading, Movie selectedMovie});

  $CinemaCopyWith<$Res> get selectedCinema;
  $MovieCopyWith<$Res> get selectedMovie;
}

/// @nodoc
class _$BookingStateCopyWithImpl<$Res, $Val extends BookingState>
    implements $BookingStateCopyWith<$Res> {
  _$BookingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCinema = null,
    Object? isLoading = null,
    Object? selectedMovie = null,
  }) {
    return _then(_value.copyWith(
      selectedCinema: null == selectedCinema
          ? _value.selectedCinema
          : selectedCinema // ignore: cast_nullable_to_non_nullable
              as Cinema,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedMovie: null == selectedMovie
          ? _value.selectedMovie
          : selectedMovie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CinemaCopyWith<$Res> get selectedCinema {
    return $CinemaCopyWith<$Res>(_value.selectedCinema, (value) {
      return _then(_value.copyWith(selectedCinema: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MovieCopyWith<$Res> get selectedMovie {
    return $MovieCopyWith<$Res>(_value.selectedMovie, (value) {
      return _then(_value.copyWith(selectedMovie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookingStateImplCopyWith<$Res>
    implements $BookingStateCopyWith<$Res> {
  factory _$$BookingStateImplCopyWith(
          _$BookingStateImpl value, $Res Function(_$BookingStateImpl) then) =
      __$$BookingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Cinema selectedCinema, bool isLoading, Movie selectedMovie});

  @override
  $CinemaCopyWith<$Res> get selectedCinema;
  @override
  $MovieCopyWith<$Res> get selectedMovie;
}

/// @nodoc
class __$$BookingStateImplCopyWithImpl<$Res>
    extends _$BookingStateCopyWithImpl<$Res, _$BookingStateImpl>
    implements _$$BookingStateImplCopyWith<$Res> {
  __$$BookingStateImplCopyWithImpl(
      _$BookingStateImpl _value, $Res Function(_$BookingStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedCinema = null,
    Object? isLoading = null,
    Object? selectedMovie = null,
  }) {
    return _then(_$BookingStateImpl(
      selectedCinema: null == selectedCinema
          ? _value.selectedCinema
          : selectedCinema // ignore: cast_nullable_to_non_nullable
              as Cinema,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedMovie: null == selectedMovie
          ? _value.selectedMovie
          : selectedMovie // ignore: cast_nullable_to_non_nullable
              as Movie,
    ));
  }
}

/// @nodoc

class _$BookingStateImpl implements _BookingState {
  const _$BookingStateImpl(
      {required this.selectedCinema,
      required this.isLoading,
      required this.selectedMovie});

  @override
  final Cinema selectedCinema;
  @override
  final bool isLoading;
  @override
  final Movie selectedMovie;

  @override
  String toString() {
    return 'BookingState(selectedCinema: $selectedCinema, isLoading: $isLoading, selectedMovie: $selectedMovie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingStateImpl &&
            (identical(other.selectedCinema, selectedCinema) ||
                other.selectedCinema == selectedCinema) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.selectedMovie, selectedMovie) ||
                other.selectedMovie == selectedMovie));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedCinema, isLoading, selectedMovie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingStateImplCopyWith<_$BookingStateImpl> get copyWith =>
      __$$BookingStateImplCopyWithImpl<_$BookingStateImpl>(this, _$identity);
}

abstract class _BookingState implements BookingState {
  const factory _BookingState(
      {required final Cinema selectedCinema,
      required final bool isLoading,
      required final Movie selectedMovie}) = _$BookingStateImpl;

  @override
  Cinema get selectedCinema;
  @override
  bool get isLoading;
  @override
  Movie get selectedMovie;
  @override
  @JsonKey(ignore: true)
  _$$BookingStateImplCopyWith<_$BookingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
