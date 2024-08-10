import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/components/app_button.dart';
import 'package:cinema_plus/src/components/movies/cast_card.dart';
import 'package:cinema_plus/src/components/movies/cast_loading.dart';
import 'package:cinema_plus/src/components/rating.dart';
import 'package:cinema_plus/src/constants/app_methods.dart';
import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/core/injections.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/models/movie/movie.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

@RoutePage()
class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
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
                      height: 350,
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
                          Positioned(
                            top: 30,
                            left: 10,
                            child: TextButton.icon(
                              onPressed: () => context.maybePop(),
                              label: Text(
                                'Back',
                                style: CPTextStyle.caption(
                                    color: CPColors.grey100),
                              ),
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: CPColors.grey100,
                                size: 14,
                              ),
                            ),
                          ),
                          const Positioned(
                            top: 30,
                            right: 10,
                            child: Icon(Ionicons.heart),
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
                            style: CPTextStyle.headline(
                                color: CPColors.white,
                                weight: FontWeight.w900,
                                size: 32),
                          ),
                          Text(
                            getTagline(movie.genreIds),
                            style: CPTextStyle.caption(color: CPColors.pink),
                          ),
                          const Gap(10),
                          Row(
                            children: [
                              Rating(rating: (movie.voteAverage / 10) * 5),
                              const Gap(10),
                              Text(
                                '${movie.voteCount} reviews',
                                style: CPTextStyle.caption(
                                  color: CPColors.grey400,
                                ),
                              )
                            ],
                          ),
                          const Gap(50),
                          Text(
                            'Storyline',
                            style:
                                CPTextStyle.subTitle(color: CPColors.white),
                          ),
                          const Gap(10),
                          Text(
                            movie.overview,
                            style:
                                CPTextStyle.subTitle(color: CPColors.grey400),
                          ),
                          const Gap(50),
                          Text(
                            'Cast',
                            style:
                                CPTextStyle.subTitle(color: CPColors.white),
                          ),
                          const Gap(10),
                          BlocBuilder<MovieCubit, MovieState>(
                            builder: (context, state) {
                              return state.isCastLoading
                                  ? const CastLoading()
                                  : state.movieCast.isEmpty
                                      ? Text(
                                          'Data not available',
                                          style: CPTextStyle.caption(
                                              color: CPColors.grey400),
                                        )
                                      : SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        // physics: NeverScrollableScrollPhysics(),
                                        child: Expanded(
                                          child: Row(
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
                      isLoading: false,
                      gradient: LinearGradient(colors: [
                        CPColors.grey500,
                        CPColors.grey800
                      ]),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                      child: AppButton(
                          title: 'BOOK YOUR TICKET', isLoading: false,
                          ontap: () => context.read<MovieCubit>().getMovieCast(movie.id),)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
