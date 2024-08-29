import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/features/movie_details/details/movie_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/booking/cubit/booking_cubit.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:cinema_plus/src/style/style.dart';

class FavoriteCard extends StatelessWidget {
  FavoriteCard(
      {super.key,
      required this.movie,
      required this.isFavorite,
      required this.onLikeButtonPressed});

  final GlobalKey likeButtonKey = GlobalKey();
  final Movie movie;
  final bool isFavorite;
  final void Function() onLikeButtonPressed;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);
    return OpenContainer(
      useRootNavigator: true,
      openBuilder: (context, closedContainer) {
        return const MovieDetailsPage();
      },
      openColor: theme.cardColor,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      closedElevation: 0,
      closedColor: theme.colorScheme.surface,
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTapDown: (details) {
            RenderBox? likeButtonRenderBox =
                likeButtonKey.currentContext?.findRenderObject() as RenderBox?;
            if (likeButtonRenderBox != null) {
              Offset localPosition =
                  likeButtonRenderBox.globalToLocal(details.globalPosition);
              if (localPosition.dx >= 0 &&
                  localPosition.dy >= 0 &&
                  localPosition.dx <= likeButtonRenderBox.size.width &&
                  localPosition.dy <= likeButtonRenderBox.size.height) {
                // Tap started on the like button
                onLikeButtonPressed();

                return; // Prevent card navigation
              }
            }
            context.read<MovieCubit>().selectMovie(movie);
            openContainer();
            // context.push(AppRoutes.movieDetail);
          },
          behavior: HitTestBehavior.translucent,
          child: Container(
            height: 200,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(defaultRadiusSm),
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Row(
              children: [
                SizedBox(
                  width: size.width / 2.8,
                  child: _MovieCard(
                    movie: movie,
                    isFavorite: isFavorite,
                    onLikeButtonPressed: onLikeButtonPressed,
                    likeButtonKey: likeButtonKey,
                  ),
                ),
                _MovieDetail(movie: movie)
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MovieDetail extends StatelessWidget {
  const _MovieDetail({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: CPTextStyle.subTitle(context, weight: FontWeight.bold),
              softWrap: true,
            ),
            const Gap(10),
            Text(
              movie.overview,
              softWrap: true,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: CPTextStyle.link(context,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            const Spacer(),
            AppButton(
              title: 'BOOK YOUR TICKET',
              height: 45,
              ontap: () {
                context.read<BookingCubit>().selectMovie(movie);
                context.push(AppRoutes.chooseSession);
              },
            )
          ],
        ),
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  _MovieCard(
      {super.key,
      required this.movie,
      required this.isFavorite,
      required this.onLikeButtonPressed,
      required this.likeButtonKey});

  final Movie movie;
  final GlobalKey likeButtonKey;
  final bool isFavorite;
  final void Function() onLikeButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(defaultRadiusSm),
        bottomLeft: Radius.circular(defaultRadiusSm),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: CachedNetworkImageProvider(
                        "${AppStrings.imageUrl}/${movie.backdropPath}"),
                    fit: BoxFit.cover),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Theme.of(context).colorScheme.primaryContainer
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 8,
            child: DecoratedBox(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                    color: CPColors.black.withOpacity(0.4),
                    offset: Offset.zero,
                    spreadRadius: 3,
                    blurRadius: 5)
              ]),
              child: Icon(
                key: likeButtonKey,
                isFavorite ? Ionicons.heart : Ionicons.heart_outline,
                color: isFavorite
                    ? Theme.of(context).colorScheme.primary
                    : CPColors.white,
              ),
            ),
          ),
          Positioned.fill(
            top: null,
            bottom: 40,
            left: 8,
            child: SizedBox(
                // width: double.minPositive,
                child: Text(
              getTagline(movie.genreIds),
              style: CPTextStyle.link(context,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  weight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            )),
          ),
          Positioned(
            left: 8,
            bottom: 30,
            child: Rating(rating: (movie.voteAverage / 10) * 5),
          ),
          Positioned(
            left: 8,
            bottom: 10,
            child: Text(
              '${movie.voteCount} reviews',
              style: CPTextStyle.link(context,
                  size: 11,
                  weight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}
