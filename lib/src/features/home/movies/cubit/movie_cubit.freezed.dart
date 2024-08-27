// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieState {
  bool get isDiscoverLoading => throw _privateConstructorUsedError;
  bool get isNowPlayingLoading => throw _privateConstructorUsedError;
  bool get isUpcomingLoading => throw _privateConstructorUsedError;
  bool get isCastLoading => throw _privateConstructorUsedError;
  List<Cast> get movieCast => throw _privateConstructorUsedError;
  List<Movie> get discoverMovies => throw _privateConstructorUsedError;
  List<Movie> get nowPlaying => throw _privateConstructorUsedError;
  List<Movie> get upcomingMovies => throw _privateConstructorUsedError;
  Actor get selectedActor => throw _privateConstructorUsedError;
  Movie get selectedMovie => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieStateCopyWith<MovieState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieStateCopyWith<$Res> {
  factory $MovieStateCopyWith(
          MovieState value, $Res Function(MovieState) then) =
      _$MovieStateCopyWithImpl<$Res, MovieState>;
  @useResult
  $Res call(
      {bool isDiscoverLoading,
      bool isNowPlayingLoading,
      bool isUpcomingLoading,
      bool isCastLoading,
      List<Cast> movieCast,
      List<Movie> discoverMovies,
      List<Movie> nowPlaying,
      List<Movie> upcomingMovies,
      Actor selectedActor,
      Movie selectedMovie,
      String? errorMessage});

  $ActorCopyWith<$Res> get selectedActor;
  $MovieCopyWith<$Res> get selectedMovie;
}

/// @nodoc
class _$MovieStateCopyWithImpl<$Res, $Val extends MovieState>
    implements $MovieStateCopyWith<$Res> {
  _$MovieStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDiscoverLoading = null,
    Object? isNowPlayingLoading = null,
    Object? isUpcomingLoading = null,
    Object? isCastLoading = null,
    Object? movieCast = null,
    Object? discoverMovies = null,
    Object? nowPlaying = null,
    Object? upcomingMovies = null,
    Object? selectedActor = null,
    Object? selectedMovie = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      isDiscoverLoading: null == isDiscoverLoading
          ? _value.isDiscoverLoading
          : isDiscoverLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNowPlayingLoading: null == isNowPlayingLoading
          ? _value.isNowPlayingLoading
          : isNowPlayingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpcomingLoading: null == isUpcomingLoading
          ? _value.isUpcomingLoading
          : isUpcomingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCastLoading: null == isCastLoading
          ? _value.isCastLoading
          : isCastLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      movieCast: null == movieCast
          ? _value.movieCast
          : movieCast // ignore: cast_nullable_to_non_nullable
              as List<Cast>,
      discoverMovies: null == discoverMovies
          ? _value.discoverMovies
          : discoverMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      nowPlaying: null == nowPlaying
          ? _value.nowPlaying
          : nowPlaying // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      upcomingMovies: null == upcomingMovies
          ? _value.upcomingMovies
          : upcomingMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      selectedActor: null == selectedActor
          ? _value.selectedActor
          : selectedActor // ignore: cast_nullable_to_non_nullable
              as Actor,
      selectedMovie: null == selectedMovie
          ? _value.selectedMovie
          : selectedMovie // ignore: cast_nullable_to_non_nullable
              as Movie,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ActorCopyWith<$Res> get selectedActor {
    return $ActorCopyWith<$Res>(_value.selectedActor, (value) {
      return _then(_value.copyWith(selectedActor: value) as $Val);
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
abstract class _$$MovieImplCopyWith<$Res> implements $MovieStateCopyWith<$Res> {
  factory _$$MovieImplCopyWith(
          _$MovieImpl value, $Res Function(_$MovieImpl) then) =
      __$$MovieImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isDiscoverLoading,
      bool isNowPlayingLoading,
      bool isUpcomingLoading,
      bool isCastLoading,
      List<Cast> movieCast,
      List<Movie> discoverMovies,
      List<Movie> nowPlaying,
      List<Movie> upcomingMovies,
      Actor selectedActor,
      Movie selectedMovie,
      String? errorMessage});

  @override
  $ActorCopyWith<$Res> get selectedActor;
  @override
  $MovieCopyWith<$Res> get selectedMovie;
}

/// @nodoc
class __$$MovieImplCopyWithImpl<$Res>
    extends _$MovieStateCopyWithImpl<$Res, _$MovieImpl>
    implements _$$MovieImplCopyWith<$Res> {
  __$$MovieImplCopyWithImpl(
      _$MovieImpl _value, $Res Function(_$MovieImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDiscoverLoading = null,
    Object? isNowPlayingLoading = null,
    Object? isUpcomingLoading = null,
    Object? isCastLoading = null,
    Object? movieCast = null,
    Object? discoverMovies = null,
    Object? nowPlaying = null,
    Object? upcomingMovies = null,
    Object? selectedActor = null,
    Object? selectedMovie = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$MovieImpl(
      isDiscoverLoading: null == isDiscoverLoading
          ? _value.isDiscoverLoading
          : isDiscoverLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isNowPlayingLoading: null == isNowPlayingLoading
          ? _value.isNowPlayingLoading
          : isNowPlayingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpcomingLoading: null == isUpcomingLoading
          ? _value.isUpcomingLoading
          : isUpcomingLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isCastLoading: null == isCastLoading
          ? _value.isCastLoading
          : isCastLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      movieCast: null == movieCast
          ? _value._movieCast
          : movieCast // ignore: cast_nullable_to_non_nullable
              as List<Cast>,
      discoverMovies: null == discoverMovies
          ? _value._discoverMovies
          : discoverMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      nowPlaying: null == nowPlaying
          ? _value._nowPlaying
          : nowPlaying // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      upcomingMovies: null == upcomingMovies
          ? _value._upcomingMovies
          : upcomingMovies // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      selectedActor: null == selectedActor
          ? _value.selectedActor
          : selectedActor // ignore: cast_nullable_to_non_nullable
              as Actor,
      selectedMovie: null == selectedMovie
          ? _value.selectedMovie
          : selectedMovie // ignore: cast_nullable_to_non_nullable
              as Movie,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$MovieImpl implements _Movie {
  const _$MovieImpl(
      {required this.isDiscoverLoading,
      required this.isNowPlayingLoading,
      required this.isUpcomingLoading,
      required this.isCastLoading,
      required final List<Cast> movieCast,
      required final List<Movie> discoverMovies,
      required final List<Movie> nowPlaying,
      required final List<Movie> upcomingMovies,
      required this.selectedActor,
      required this.selectedMovie,
      required this.errorMessage})
      : _movieCast = movieCast,
        _discoverMovies = discoverMovies,
        _nowPlaying = nowPlaying,
        _upcomingMovies = upcomingMovies;

  @override
  final bool isDiscoverLoading;
  @override
  final bool isNowPlayingLoading;
  @override
  final bool isUpcomingLoading;
  @override
  final bool isCastLoading;
  final List<Cast> _movieCast;
  @override
  List<Cast> get movieCast {
    if (_movieCast is EqualUnmodifiableListView) return _movieCast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_movieCast);
  }

  final List<Movie> _discoverMovies;
  @override
  List<Movie> get discoverMovies {
    if (_discoverMovies is EqualUnmodifiableListView) return _discoverMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_discoverMovies);
  }

  final List<Movie> _nowPlaying;
  @override
  List<Movie> get nowPlaying {
    if (_nowPlaying is EqualUnmodifiableListView) return _nowPlaying;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nowPlaying);
  }

  final List<Movie> _upcomingMovies;
  @override
  List<Movie> get upcomingMovies {
    if (_upcomingMovies is EqualUnmodifiableListView) return _upcomingMovies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingMovies);
  }

  @override
  final Actor selectedActor;
  @override
  final Movie selectedMovie;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'MovieState(isDiscoverLoading: $isDiscoverLoading, isNowPlayingLoading: $isNowPlayingLoading, isUpcomingLoading: $isUpcomingLoading, isCastLoading: $isCastLoading, movieCast: $movieCast, discoverMovies: $discoverMovies, nowPlaying: $nowPlaying, upcomingMovies: $upcomingMovies, selectedActor: $selectedActor, selectedMovie: $selectedMovie, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieImpl &&
            (identical(other.isDiscoverLoading, isDiscoverLoading) ||
                other.isDiscoverLoading == isDiscoverLoading) &&
            (identical(other.isNowPlayingLoading, isNowPlayingLoading) ||
                other.isNowPlayingLoading == isNowPlayingLoading) &&
            (identical(other.isUpcomingLoading, isUpcomingLoading) ||
                other.isUpcomingLoading == isUpcomingLoading) &&
            (identical(other.isCastLoading, isCastLoading) ||
                other.isCastLoading == isCastLoading) &&
            const DeepCollectionEquality()
                .equals(other._movieCast, _movieCast) &&
            const DeepCollectionEquality()
                .equals(other._discoverMovies, _discoverMovies) &&
            const DeepCollectionEquality()
                .equals(other._nowPlaying, _nowPlaying) &&
            const DeepCollectionEquality()
                .equals(other._upcomingMovies, _upcomingMovies) &&
            (identical(other.selectedActor, selectedActor) ||
                other.selectedActor == selectedActor) &&
            (identical(other.selectedMovie, selectedMovie) ||
                other.selectedMovie == selectedMovie) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isDiscoverLoading,
      isNowPlayingLoading,
      isUpcomingLoading,
      isCastLoading,
      const DeepCollectionEquality().hash(_movieCast),
      const DeepCollectionEquality().hash(_discoverMovies),
      const DeepCollectionEquality().hash(_nowPlaying),
      const DeepCollectionEquality().hash(_upcomingMovies),
      selectedActor,
      selectedMovie,
      errorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      __$$MovieImplCopyWithImpl<_$MovieImpl>(this, _$identity);
}

abstract class _Movie implements MovieState {
  const factory _Movie(
      {required final bool isDiscoverLoading,
      required final bool isNowPlayingLoading,
      required final bool isUpcomingLoading,
      required final bool isCastLoading,
      required final List<Cast> movieCast,
      required final List<Movie> discoverMovies,
      required final List<Movie> nowPlaying,
      required final List<Movie> upcomingMovies,
      required final Actor selectedActor,
      required final Movie selectedMovie,
      required final String? errorMessage}) = _$MovieImpl;

  @override
  bool get isDiscoverLoading;
  @override
  bool get isNowPlayingLoading;
  @override
  bool get isUpcomingLoading;
  @override
  bool get isCastLoading;
  @override
  List<Cast> get movieCast;
  @override
  List<Movie> get discoverMovies;
  @override
  List<Movie> get nowPlaying;
  @override
  List<Movie> get upcomingMovies;
  @override
  Actor get selectedActor;
  @override
  Movie get selectedMovie;
  @override
  String? get errorMessage;
  @override
  @JsonKey(ignore: true)
  _$$MovieImplCopyWith<_$MovieImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
