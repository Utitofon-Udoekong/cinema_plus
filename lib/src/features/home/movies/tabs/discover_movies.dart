import 'package:cinema_plus/src/components/app_button.dart';
import 'package:cinema_plus/src/components/movies/movie_card.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverMovies extends StatelessWidget {
  const DiscoverMovies({super.key});

  @override
  Widget build(BuildContext context) {
    final movies =
        context.select((MovieCubit bloc) => bloc.state.discoverMovies);
    return movies.isEmpty ? 
      Center(
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          return AppButton(
            title: 'Discover',
            isLoading: state.isDiscoverLoading,
            ontap: () => context.read<MovieCubit>().discoverMovies(),
          );
        },
      ),
    ): GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 9/16,
      children: movies.map((movie) {
        return MovieCard(movie: movie);
      }).toList(),
    );
    // Center(
    //   child: BlocBuilder<MovieCubit, MovieState>(
    //     builder: (context, state) {
    //       return AppButton(
    //         title: 'Discover',
    //         isLoading: state.isDiscoverLoading,
    //         ontap: () => context.read<MovieCubit>().discoverMovies(),
    //       );
    //     },
    //   ),
    // );
  }
}
