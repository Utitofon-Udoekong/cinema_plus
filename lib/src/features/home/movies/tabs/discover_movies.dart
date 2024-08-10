import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/style/style.dart';

class DiscoverMovies extends StatelessWidget {
  const DiscoverMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final movies =
        context.select((MovieCubit bloc) => bloc.state.discoverMovies);
    final isLoading =
        context.select((MovieCubit bloc) => bloc.state.isDiscoverLoading);
    return isLoading
        ? GridView.count(
            crossAxisCount: 2,
            children: List.generate(
              8,
              (_) => const FilmLoading(),
            ),
          )
        : movies.isEmpty
            ? Center(
                child: Text(
                  'Data not available',
                  style: CPTextStyle.caption(color: CPColors.grey400),
                ),
              )
            : GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 9 / 16,
                children: movies.map((movie) {
                  return MovieCard(movie: movie);
                }).toList(),
              );
  }
}
