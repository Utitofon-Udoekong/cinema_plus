import 'package:cinema_plus/src/components/movies/favorite_card.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart' show defaultPadding, WidgetSpace;
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
          children: favorites.isEmpty
              ? [
                  Center(
                    child: Text(
                      'No movies found',
                      style: CPTextStyle.caption(
                        context,
                      ),
                    ),
                  )
                ]
              : favorites.map(
                  (movie) {
                    return FavoriteCard(
                      movie: movie,
                      onLikeButtonPressed: () => context
                          .read<FavouriteCubit>()
                          .removeFromFavorites(movie.id.toString()),
                      isFavorite: true,
                    );
                  },
                ).withSpacing(10),
        ),
      ),
    );
  }
}
