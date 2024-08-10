// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:cinema_plus/src/features/authentication/create_account_page.dart'
    as _i3;
import 'package:cinema_plus/src/features/authentication/sign_in_page.dart'
    as _i9;
import 'package:cinema_plus/src/features/home/cinemas/cinemas_page.dart' as _i2;
import 'package:cinema_plus/src/features/home/favorites/favorites_page.dart'
    as _i4;
import 'package:cinema_plus/src/features/home/home_page.dart' as _i5;
import 'package:cinema_plus/src/features/home/movies/details/cast_detail_page.dart'
    as _i1;
import 'package:cinema_plus/src/features/home/movies/details/movie_details_page.dart'
    as _i6;
import 'package:cinema_plus/src/features/home/movies/movies_page.dart' as _i7;
import 'package:cinema_plus/src/features/home/profile/profile_page.dart' as _i8;
import 'package:cinema_plus/src/features/home/splash_page.dart' as _i10;
import 'package:cinema_plus/src/features/home/tickets/tickets_page.dart'
    as _i11;
import 'package:cinema_plus/src/models/movie/movie.dart' as _i14;
import 'package:flutter/material.dart' as _i13;

/// generated route for
/// [_i1.CastDetailPage]
class CastDetailRoute extends _i12.PageRouteInfo<void> {
  const CastDetailRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CastDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CastDetailRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.CastDetailPage();
    },
  );
}

/// generated route for
/// [_i2.CinemasPage]
class CinemasRoute extends _i12.PageRouteInfo<void> {
  const CinemasRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CinemasRoute.name,
          initialChildren: children,
        );

  static const String name = 'CinemasRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i2.CinemasPage();
    },
  );
}

/// generated route for
/// [_i3.CreateAccountPage]
class CreateAccountRoute extends _i12.PageRouteInfo<void> {
  const CreateAccountRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CreateAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreateAccountRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i3.CreateAccountPage();
    },
  );
}

/// generated route for
/// [_i4.FavoritesPage]
class FavoritesRoute extends _i12.PageRouteInfo<void> {
  const FavoritesRoute({List<_i12.PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.FavoritesPage();
    },
  );
}

/// generated route for
/// [_i5.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomePage();
    },
  );
}

/// generated route for
/// [_i6.MovieDetailsPage]
class MovieDetailsRoute extends _i12.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    _i13.Key? key,
    required _i14.Movie movie,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MovieDetailsRouteArgs>();
      return _i6.MovieDetailsPage(
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

  final _i13.Key? key;

  final _i14.Movie movie;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i7.MoviesPage]
class MoviesRoute extends _i12.PageRouteInfo<void> {
  const MoviesRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoviesRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.MoviesPage();
    },
  );
}

/// generated route for
/// [_i8.ProfilePage]
class ProfileRoute extends _i12.PageRouteInfo<void> {
  const ProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfilePage();
    },
  );
}

/// generated route for
/// [_i9.SignInPage]
class SignInRoute extends _i12.PageRouteInfo<void> {
  const SignInRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i9.SignInPage();
    },
  );
}

/// generated route for
/// [_i10.SplashPage]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i10.SplashPage();
    },
  );
}

/// generated route for
/// [_i11.TicketsPage]
class TicketsRoute extends _i12.PageRouteInfo<void> {
  const TicketsRoute({List<_i12.PageRouteInfo>? children})
      : super(
          TicketsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TicketsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.TicketsPage();
    },
  );
}
