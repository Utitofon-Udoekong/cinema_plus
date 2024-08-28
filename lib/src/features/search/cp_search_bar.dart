import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/features/search/cubit/search_cubit.dart';
import 'package:cinema_plus/src/features/search/cp_search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CPSearchBar extends StatelessWidget implements PreferredSizeWidget {
  const CPSearchBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => context.push(AppRoutes.profile),
        padding: EdgeInsets.zero,
        iconSize: 30,
        icon: Icon(
          Icons.account_circle,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.search,
                color: Theme.of(context).colorScheme.onSurface),
            onPressed: () {
              showSearchBar(context);
            })
      ],
    );
  }
}

void showSearchBar(BuildContext context) {
  showSearch(
    context: context,
    useRootNavigator: true,
    delegate: DebouncedSearchDelegate(
        context: context,
        debounceDuration: const Duration(milliseconds: 700),
        searchFunction: (query) async {
          // Simulate an API call or database search
          return await context.read<SearchCubit>().searchMovie(query);
        },
        showMovieDetails: (movie) {
          context.read<MovieCubit>().selectMovie(movie);
          context.push(AppRoutes.movieDetail);
        }),
  );
}
