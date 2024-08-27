import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/components/rating.dart';
import 'package:cinema_plus/src/constants/app_methods.dart';
import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/models/movie/movie.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:ionicons/ionicons.dart';

class MovieCard extends StatelessWidget {
  MovieCard(
      {super.key,
      required this.movie,
      required this.onLikeButtonPressed,
      required this.isFavorite});
  final Movie movie;

  final GlobalKey likeButtonKey = GlobalKey();
  final bool isFavorite;
  final void Function() onLikeButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(defaultRadiusMd),
      child: GestureDetector(
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
          context.push(AppRoutes.movieDetail);
        },
        behavior: HitTestBehavior.translucent,
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(defaultRadiusMd),
            child: Column(
              children: [
                Expanded(
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
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                                color: CPColors.black.withOpacity(0.4),
                                offset: Offset.zero,
                                spreadRadius: 3,
                                blurRadius: 5)
                          ]),
                          child: Icon(
                            key: likeButtonKey,
                            isFavorite
                                ? Ionicons.heart
                                : Ionicons.heart_outline,
                            color: isFavorite
                                ? Theme.of(context).colorScheme.primary
                                : CPColors.white,
                          ),
                        ),
                      ),
                      Positioned.fill(
                        top: null,
                        bottom: 30,
                        left: 8,
                        child: SizedBox(
                            // width: double.minPositive,
                            child: Text(
                          getTagline(movie.genreIds),
                          style: CPTextStyle.link(context,
                              color: Theme.of(context).colorScheme.primary, weight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
            ),
                      Positioned(
                        left: 8,
                        bottom: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Rating(rating: (movie.voteAverage / 10) * 5),
                            const Gap(3),
                            Text(
                              '${movie.voteCount} reviews',
                              style: CPTextStyle.link(context,
                                  color: CPColors.grey500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  width: double.infinity,
                  color: Theme.of(context).colorScheme.primaryContainer,
                  child: Text(movie.title,
                      style: CPTextStyle.link(context, weight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
