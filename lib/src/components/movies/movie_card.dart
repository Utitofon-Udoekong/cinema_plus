import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/components/rating.dart';
import 'package:cinema_plus/src/constants/app_methods.dart';
import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/core/router/router.gr.dart';
import 'package:cinema_plus/src/models/movie/movie.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                    const Positioned(
                      top: 10,
                      right: 8,
                      child: Icon(Ionicons.heart),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 8,
                      child: SizedBox(
                        width: double.maxFinite,
                        child: Text(
                          getTagline(movie.genreIds),
                          style: CPTextStyle.link(color: CPColors.pink, size: 10),
                          // maxLines: 2,
                        )
                      ),
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
                            style: CPTextStyle.link(color: CPColors.grey500),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => context.router.push(MovieDetailsRoute(movie: movie)),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  width: double.infinity,
                  color: CPColors.grey800,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style: CPTextStyle.link(color: CPColors.white, weight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis
                      ),
                      const Gap(10),
                      // Text("${movie.runtime} MIN", style: CPTextStyle.caption(color: CPColors.grey600),),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
