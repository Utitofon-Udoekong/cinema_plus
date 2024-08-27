import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/booking/cubit/booking_cubit.dart';
import 'package:cinema_plus/src/features/home/favorites/cubit/favourite_cubit.dart';

import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/style/style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final movie = context.select((MovieCubit bloc) => bloc.state.selectedMovie);
    context.read<MovieCubit>().getMovieCast(movie.id);
    final favouriteMovies =
        context.select((FavouriteCubit bloc) => bloc.state.favoriteMovies);
    final isFavorite = favouriteMovies.any((m) => m.id == movie.id);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                      "${AppStrings.imageUrl}/${movie.backdropPath}"),
                                  colorFilter: ColorFilter.mode(
                                      Theme.of(context).colorScheme.surface,
                                      BlendMode.color),
                                  fit: BoxFit.cover),
                            ),
                            // child: ,
                          ),
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Theme.of(context).colorScheme.surface
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surface
                                  .withOpacity(0.8),
                            ),
                          ),
                          const Positioned(
                            top: 30,
                            left: 15,
                            child: AppBackButton(),
                          ),
                          Positioned(
                            top: 30,
                            right: 15,
                            child: InkWell(
                              onTap: () {
                                if (isFavorite) {
                                  context
                                      .read<FavouriteCubit>()
                                      .removeFromFavorites(movie.id.toString());
                                } else {
                                  context
                                      .read<FavouriteCubit>()
                                      .addToFavorites(movie);
                                }
                              },
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              CPColors.black.withOpacity(0.4),
                                          offset: Offset.zero,
                                          spreadRadius: 3,
                                          blurRadius: 5)
                                    ]),
                                child: Icon(
                                  isFavorite
                                      ? Ionicons.heart
                                      : Ionicons.heart_outline,
                                  color: isFavorite
                                      ? Theme.of(context).colorScheme.primary
                                      : CPColors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: defaultPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title,
                            style: CPTextStyle.headline(context,
                                weight: FontWeight.w900, size: 32),
                          ),
                          Text(
                            getTagline(movie.genreIds),
                            style: CPTextStyle.caption(context,
                                color: Theme.of(context).colorScheme.primary),
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              Rating(rating: (movie.voteAverage / 10) * 5),
                              const Gap(10),
                              Text(
                                '${movie.voteCount} reviews',
                                style: CPTextStyle.caption(
                                  context,
                                  color: CPColors.grey400,
                                ),
                              )
                            ],
                          ),
                          const Gap(50),
                          Text(
                            'Storyline',
                            style: CPTextStyle.subTitle(
                              context,
                            ),
                          ),
                          const Gap(10),
                          Text(
                            movie.overview,
                            style: CPTextStyle.subTitle(context,
                                color: CPColors.grey400),
                          ),
                          const Gap(50),
                          Text(
                            'Cast',
                            style: CPTextStyle.subTitle(
                              context,
                            ),
                          ),
                          const Gap(10),
                          BlocBuilder<MovieCubit, MovieState>(
                            builder: (context, state) {
                              return state.isCastLoading
                                  ? const CastLoading()
                                  : state.movieCast.isEmpty
                                      ? Text(
                                          'Data not available',
                                          style: CPTextStyle.caption(context,
                                              color: CPColors.grey400),
                                        )
                                      : SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Expanded(
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children:
                                                  state.movieCast.map((cast) {
                                                return Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  child: CastCard(cast: cast),
                                                );
                                              }).toList(),
                                            ),
                                          ),
                                        );
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: defaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    child: AppButton(
                      title: 'LEAVE A REVIEW',
                      gradient: LinearGradient(
                          colors: [CPColors.grey500, CPColors.grey800]),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: AppButton(
                      title: 'BOOK YOUR TICKET',
                      ontap: () {
                        context.read<BookingCubit>().selectMovie(movie);
                        context.push(AppRoutes.chooseSession);
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
