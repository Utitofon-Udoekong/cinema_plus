import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import 'package:cinema_plus/src/components/components.dart' show MovieCard;
import 'package:cinema_plus/src/features/home/favorites/cubit/favourite_cubit.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/models/models.dart' show Movie;
import 'package:cinema_plus/src/style/style.dart' show CPColors, CPTextStyle;

class UpcomingMovies extends StatefulWidget {
  const UpcomingMovies({super.key});

  @override
  State<UpcomingMovies> createState() => _UpcomingMoviesState();
}

class _UpcomingMoviesState extends State<UpcomingMovies>
    with AutomaticKeepAliveClientMixin {
  final PagingController<int, Movie> _pagingController =
      PagingController(firstPageKey: 1);

  @override
  bool get wantKeepAlive => (_pagingController.itemList ?? []).isNotEmpty;

  @override
  void initState() {
    _pagingController.addPageRequestListener((int pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      final isFetched =
          await context.read<MovieCubit>().getUpcomingMovies(pageKey);
      if (isFetched) {
        final newItems = context.read<MovieCubit>().state.upcomingMovies;
        final nextPageKey = pageKey += 1;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    
    final favouriteMovies =
        context.select((FavouriteCubit bloc) => bloc.state.favoriteMovies);
    return PagedGridView<int, Movie>(
      pagingController: _pagingController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 9 / 16,
      ),
      builderDelegate: PagedChildBuilderDelegate<Movie>(
        animateTransitions: true,
        noItemsFoundIndicatorBuilder: (context) {
          return Center(
            child: Text(
              'Data not available',
              style: CPTextStyle.caption(context, color: CPColors.grey400),
            ),
          );
        },
        itemBuilder: (context, movie, index) {
          final isFavorite = favouriteMovies.any((m) => m.id == movie.id);
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
        },
      ),
    );
  }
}
