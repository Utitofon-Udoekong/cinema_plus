// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FavouriteState {
  List<Movie> get favoriteMovies => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get failure => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouriteStateCopyWith<FavouriteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteStateCopyWith<$Res> {
  factory $FavouriteStateCopyWith(
          FavouriteState value, $Res Function(FavouriteState) then) =
      _$FavouriteStateCopyWithImpl<$Res, FavouriteState>;
  @useResult
  $Res call({List<Movie> favoriteMovies, bool isLoading, String failure});
}

/// @nodoc
class _$FavouriteStateCopyWithImpl<$Res, $Val extends FavouriteState>
    implements $FavouriteStateCopyWith<$Res> {
  _$FavouriteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteMovies = null,
    Object? isLoading = null,
    Object? failure = null,
  }) {
    return _then(_value.copyWith(
      favoriteMovies: null == favoriteMovies
          ? _value.favoriteMovies
          : favoriteMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouriteStateImplCopyWith<$Res>
    implements $FavouriteStateCopyWith<$Res> {
  factory _$$FavouriteStateImplCopyWith(_$FavouriteStateImpl value,
          $Res Function(_$FavouriteStateImpl) then) =
      __$$FavouriteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Movie> favoriteMovies, bool isLoading, String failure});
}

/// @nodoc
class __$$FavouriteStateImplCopyWithImpl<$Res>
    extends _$FavouriteStateCopyWithImpl<$Res, _$FavouriteStateImpl>
    implements _$$FavouriteStateImplCopyWith<$Res> {
  __$$FavouriteStateImplCopyWithImpl(
      _$FavouriteStateImpl _value, $Res Function(_$FavouriteStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favoriteMovies = null,
    Object? isLoading = null,
    Object? failure = null,
  }) {
    return _then(_$FavouriteStateImpl(
      favoriteMovies: null == favoriteMovies
          ? _value._favoriteMovies
          : favoriteMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FavouriteStateImpl implements _FavouriteState {
  const _$FavouriteStateImpl(
      {required final List<Movie> favoriteMovies,
      required this.isLoading,
      required this.failure})
      : _favoriteMovies = favoriteMovies;

  final List<Movie> _favoriteMovies;
  @override
  List<Movie> get favoriteMovies {
    if (_favoriteMovies is EqualUnmodifiableListView) return _favoriteMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoriteMovies);
  }

  @override
  final bool isLoading;
  @override
  final String failure;

  @override
  String toString() {
    return 'FavouriteState(favoriteMovies: $favoriteMovies, isLoading: $isLoading, failure: $failure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteStateImpl &&
            const DeepCollectionEquality()
                .equals(other._favoriteMovies, _favoriteMovies) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_favoriteMovies), isLoading, failure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteStateImplCopyWith<_$FavouriteStateImpl> get copyWith =>
      __$$FavouriteStateImplCopyWithImpl<_$FavouriteStateImpl>(
          this, _$identity);
}

abstract class _FavouriteState implements FavouriteState {
  const factory _FavouriteState(
      {required final List<Movie> favoriteMovies,
      required final bool isLoading,
      required final String failure}) = _$FavouriteStateImpl;

  @override
  List<Movie> get favoriteMovies;
  @override
  bool get isLoading;
  @override
  String get failure;
  @override
  @JsonKey(ignore: true)
  _$$FavouriteStateImplCopyWith<_$FavouriteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
