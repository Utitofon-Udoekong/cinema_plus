import 'package:cinema_plus/src/components/app_button.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<MovieCubit, MovieState>(
        builder: (context, state) {
          return AppButton(
            title: 'Now playing',
            isLoading: state.isDiscoverLoading,
            ontap: () => context.read<MovieCubit>().getNowPlayingMovies(),
          );
        },
      ),
    );
  }
}