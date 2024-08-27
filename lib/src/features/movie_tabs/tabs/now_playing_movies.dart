import 'package:cinema_plus/src/features/home/favorites/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/style/style.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = context.select((MovieCubit bloc) => bloc.state.nowPlaying);
    final isLoading =
        context.select((MovieCubit bloc) => bloc.state.isNowPlayingLoading);
    final favouriteMovies =
        context.select((FavouriteCubit bloc) => bloc.state.favoriteMovies);
    return isLoading
        ? GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 9 / 16,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: List.generate(
              8,
              (_) => const MovieLoading(),
            ),
          )
        : movies.isEmpty
            ? Center(
                child: Text(
                  'Data not available',
                  style: CPTextStyle.caption(context, color: CPColors.grey400),
                ),
              )
            : GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 9 / 16,
                children: movies.map((movie) {
                  final isFavorite =
                      favouriteMovies.any((m) => m.id == movie.id);
                  return MovieCard(
                    movie: movie,
                    isFavorite: isFavorite,
                    onLikeButtonPressed: () {
                      if (isFavorite) {
                        context
                            .read<FavouriteCubit>()
                            .removeFromFavorites(movie.id.toString());
                      } else {
                        context.read<FavouriteCubit>().addToFavorites(movie);
                      }
                    },
                  );
                }).toList(),
              );
  }
}
