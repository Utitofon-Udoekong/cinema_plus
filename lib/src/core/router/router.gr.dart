// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:cinema_plus/src/features/authentication/create_account_page.dart'
    as _i5;
import 'package:cinema_plus/src/features/authentication/sign_in_page.dart'
    as _i11;
import 'package:cinema_plus/src/features/booking/cinema/choose_seat_page.dart'
    as _i2;
import 'package:cinema_plus/src/features/booking/cinema/choose_session_page.dart'
    as _i3;
import 'package:cinema_plus/src/features/home/cinemas/cinemas_page.dart' as _i4;
import 'package:cinema_plus/src/features/home/favorites/favorites_page.dart'
    as _i6;
import 'package:cinema_plus/src/features/home/home_page.dart' as _i7;
import 'package:cinema_plus/src/features/home/movies/movies_page.dart' as _i9;
import 'package:cinema_plus/src/features/home/profile/profile_page.dart'
    as _i10;
import 'package:cinema_plus/src/features/home/splash_page.dart' as _i12;
import 'package:cinema_plus/src/features/home/tickets/tickets_page.dart'
    as _i13;
import 'package:cinema_plus/src/features/movie_details/details/cast_detail_page.dart'
    as _i1;
import 'package:cinema_plus/src/features/movie_details/details/movie_details_page.dart'
    as _i8;
import 'package:cinema_plus/src/models/models.dart' as _i16;
import 'package:flutter/material.dart' as _i15;

/// generated route for
/// [_i1.CastDetailPage]
class CastDetailRoute extends _i14.PageRouteInfo<void> {
  const CastDetailRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CastDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CastDetailRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.CastDetailPage();
    },
  );
}

/// generated route for
/// [_i2.ChooseSeatPage]
class ChooseSeatRoute extends _i14.PageRouteInfo<void> {
  const ChooseSeatRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ChooseSeatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseSeatRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.ChooseSeatPage();
    },
  );
}

/// generated route for
/// [_i3.ChooseSessionPage]
class ChooseSessionRoute extends _i14.PageRouteInfo<void> {
  const ChooseSessionRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ChooseSessionRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseSessionRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.ChooseSessionPage();
    },
  );
}

/// generated route for
/// [_i4.CinemasPage]
class CinemasRoute extends _i14.PageRouteInfo<void> {
  const CinemasRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CinemasRoute.name,
          initialChildren: children,
        );

  static const String name = 'CinemasRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.CinemasPage();
    },
  );
}

/// generated route for
/// [_i5.CreateAccountPage]
class CreateAccountRoute extends _i14.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i14.PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.CreateAccountPage();
    },
  );
}

/// generated route for
/// [_i6.FavoritesPage]
class FavoritesRoute extends _i14.PageRouteInfo<void> {
  const FavoritesRoute({List<_i14.PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.FavoritesPage();
    },
  );
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomePage();
    },
  );
}

/// generated route for
/// [_i8.MovieDetailsPage]
class MovieDetailsRoute extends _i14.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    _i15.Key? key,
    required _i16.Movie movie,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return _i8.MovieDetailsPage(
        key: args.key,
        movie: args.movie,
      );
    },
  );
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.movie,
  });

  final _i15.Key? key;

  final _i16.Movie movie;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i9.MoviesPage]
class MoviesRoute extends _i14.PageRouteInfo<void> {
  const MoviesRoute({List<_i14.PageRouteInfo>? children})
      : super(
          MoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoviesRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.MoviesPage();
    },
  );
}

/// generated route for
/// [_i10.ProfilePage]
class ProfileRoute extends _i14.PageRouteInfo<void> {
  const ProfileRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.ProfilePage();
    },
  );
}

/// generated route for
/// [_i11.SignInPage]
class SignInRoute extends _i14.PageRouteInfo<void> {
  const SignInRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.SignInPage();
    },
  );
}

/// generated route for
/// [_i12.SplashPage]
class SplashRoute extends _i14.PageRouteInfo<void> {
  const SplashRoute({List<_i14.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashPage();
    },
  );
}

/// generated route for
/// [_i13.TicketsPage]
class TicketsRoute extends _i14.PageRouteInfo<void> {
  const TicketsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          TicketsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.TicketsPage();
    },
  );
}
