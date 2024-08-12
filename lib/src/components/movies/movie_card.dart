import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/components/rating.dart';
import 'package:cinema_plus/src/constants/app_methods.dart';
import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/core/bloc_observer.dart';
import 'package:cinema_plus/src/core/router/router.gr.dart';
import 'package:cinema_plus/src/models/movie/movie.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

class MovieCard extends StatelessWidget {
  MovieCard({super.key, required this.movie});
  final Movie movie;

  final GlobalKey likeButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
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
            logger.i("Like button pressed");
            // onLikeButtonPressed();
            return; // Prevent card navigation
          }
        }
        context.router.push(MovieDetailsRoute(movie: movie));
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
                              Theme.of(context).colorScheme.surface
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 8,
                      child: Icon(key: likeButtonKey, Ionicons.heart),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 8,
                      child: SizedBox(
                          width: double.maxFinite,
                          child: Text(
                            getTagline(movie.genreIds),
                            style: CPTextStyle.link(context,
                                color: CPColors.pink, size: 10),
                            // maxLines: 2,
                          )),
                    ),
                    Positioned(
                      left: 8,
                      right: 8,
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
                color: CPColors.grey800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(movie.title,
                        style: CPTextStyle.link(context, weight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const Gap(10),
                    // Text("${movie.runtime} MIN", style: CPTextStyle.caption(context,color: CPColors.grey600),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
