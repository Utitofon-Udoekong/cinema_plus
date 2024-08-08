// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ticket _$TicketFromJson(Map<String, dynamic> json) {
  return _Ticket.fromJson(json);
}

/// @nodoc
mixin _$Ticket {
  String get bookingId => throw _privateConstructorUsedError;
  int get movieId => throw _privateConstructorUsedError;
  String get movieTitle => throw _privateConstructorUsedError;
  String get moviePoster => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get hall => throw _privateConstructorUsedError;
  String get cinema => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get row => throw _privateConstructorUsedError;
  List<String> get seats => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TicketCopyWith<Ticket> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketCopyWith<$Res> {
  factory $TicketCopyWith(Ticket value, $Res Function(Ticket) then) =
      _$TicketCopyWithImpl<$Res, Ticket>;
  @useResult
  $Res call(
      {String bookingId,
      int movieId,
      String movieTitle,
      String moviePoster,
      DateTime date,
      String hall,
      String cinema,
      String location,
      String row,
      List<String> seats});
}

/// @nodoc
class _$TicketCopyWithImpl<$Res, $Val extends Ticket>
    implements $TicketCopyWith<$Res> {
  _$TicketCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? movieId = null,
    Object? movieTitle = null,
    Object? moviePoster = null,
    Object? date = null,
    Object? hall = null,
    Object? cinema = null,
    Object? location = null,
    Object? row = null,
    Object? seats = null,
  }) {
    return _then(_value.copyWith(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
      movieTitle: null == movieTitle
          ? _value.movieTitle
          : movieTitle // ignore: cast_nullable_to_non_nullable
              as String,
      moviePoster: null == moviePoster
          ? _value.moviePoster
          : moviePoster // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hall: null == hall
          ? _value.hall
          : hall // ignore: cast_nullable_to_non_nullable
              as String,
      cinema: null == cinema
          ? _value.cinema
          : cinema // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value.seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketImplCopyWith<$Res> implements $TicketCopyWith<$Res> {
  factory _$$TicketImplCopyWith(
          _$TicketImpl value, $Res Function(_$TicketImpl) then) =
      __$$TicketImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String bookingId,
      int movieId,
      String movieTitle,
      String moviePoster,
      DateTime date,
      String hall,
      String cinema,
      String location,
      String row,
      List<String> seats});
}

/// @nodoc
class __$$TicketImplCopyWithImpl<$Res>
    extends _$TicketCopyWithImpl<$Res, _$TicketImpl>
    implements _$$TicketImplCopyWith<$Res> {
  __$$TicketImplCopyWithImpl(
      _$TicketImpl _value, $Res Function(_$TicketImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bookingId = null,
    Object? movieId = null,
    Object? movieTitle = null,
    Object? moviePoster = null,
    Object? date = null,
    Object? hall = null,
    Object? cinema = null,
    Object? location = null,
    Object? row = null,
    Object? seats = null,
  }) {
    return _then(_$TicketImpl(
      bookingId: null == bookingId
          ? _value.bookingId
          : bookingId // ignore: cast_nullable_to_non_nullable
              as String,
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
      movieTitle: null == movieTitle
          ? _value.movieTitle
          : movieTitle // ignore: cast_nullable_to_non_nullable
              as String,
      moviePoster: null == moviePoster
          ? _value.moviePoster
          : moviePoster // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      hall: null == hall
          ? _value.hall
          : hall // ignore: cast_nullable_to_non_nullable
              as String,
      cinema: null == cinema
          ? _value.cinema
          : cinema // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      row: null == row
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as String,
      seats: null == seats
          ? _value._seats
          : seats // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketImpl implements _Ticket {
  const _$TicketImpl(
      {required this.bookingId,
      required this.movieId,
      required this.movieTitle,
      required this.moviePoster,
      required this.date,
      required this.hall,
      required this.cinema,
      required this.location,
      required this.row,
      required final List<String> seats})
      : _seats = seats;

  factory _$TicketImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketImplFromJson(json);

  @override
  final String bookingId;
  @override
  final int movieId;
  @override
  final String movieTitle;
  @override
  final String moviePoster;
  @override
  final DateTime date;
  @override
  final String hall;
  @override
  final String cinema;
  @override
  final String location;
  @override
  final String row;
  final List<String> _seats;
  @override
  List<String> get seats {
    if (_seats is EqualUnmodifiableListView) return _seats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seats);
  }

  @override
  String toString() {
    return 'Ticket(bookingId: $bookingId, movieId: $movieId, movieTitle: $movieTitle, moviePoster: $moviePoster, date: $date, hall: $hall, cinema: $cinema, location: $location, row: $row, seats: $seats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketImpl &&
            (identical(other.bookingId, bookingId) ||
                other.bookingId == bookingId) &&
            (identical(other.movieId, movieId) || other.movieId == movieId) &&
            (identical(other.movieTitle, movieTitle) ||
                other.movieTitle == movieTitle) &&
            (identical(other.moviePoster, moviePoster) ||
                other.moviePoster == moviePoster) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.hall, hall) || other.hall == hall) &&
            (identical(other.cinema, cinema) || other.cinema == cinema) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.row, row) || other.row == row) &&
            const DeepCollectionEquality().equals(other._seats, _seats));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      bookingId,
      movieId,
      movieTitle,
      moviePoster,
      date,
      hall,
      cinema,
      location,
      row,
      const DeepCollectionEquality().hash(_seats));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      __$$TicketImplCopyWithImpl<_$TicketImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketImplToJson(
      this,
    );
  }
}

abstract class _Ticket implements Ticket {
  const factory _Ticket(
      {required final String bookingId,
      required final int movieId,
      required final String movieTitle,
      required final String moviePoster,
      required final DateTime date,
      required final String hall,
      required final String cinema,
      required final String location,
      required final String row,
      required final List<String> seats}) = _$TicketImpl;

  factory _Ticket.fromJson(Map<String, dynamic> json) = _$TicketImpl.fromJson;

  @override
  String get bookingId;
  @override
  int get movieId;
  @override
  String get movieTitle;
  @override
  String get moviePoster;
  @override
  DateTime get date;
  @override
  String get hall;
  @override
  String get cinema;
  @override
  String get location;
  @override
  String get row;
  @override
  List<String> get seats;
  @override
  @JsonKey(ignore: true)
  _$$TicketImplCopyWith<_$TicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
