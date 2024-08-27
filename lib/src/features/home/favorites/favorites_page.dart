import 'package:cinema_plus/src/components/movies/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/home/favorites/cubit/favourite_cubit.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites =
        context.select((FavouriteCubit bloc) => bloc.state.favoriteMovies);
    return Scaffold(
      appBar: const PageHeader(
        title: 'Favorite Movies',
        showBack: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: defaultPadding,
          children: favorites.map((movie) {
            return FavoriteCard(
              movie: movie,
              onLikeButtonPressed: () => context
                  .read<FavouriteCubit>()
                  .removeFromFavorites(movie.id.toString()),
              isFavorite: true,
            );
          }).withSpacing(10),
        ),
      ),
    );
  }
}
