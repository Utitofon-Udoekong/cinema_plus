import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/components/app_button.dart';
import 'package:cinema_plus/src/components/movies/cast_loading.dart';
import 'package:cinema_plus/src/components/movies/film_card.dart';
import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/models/movie/actor/actor.dart';
import 'package:cinema_plus/src/models/movie/cast/cast.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

@RoutePage()
class CastDetailPage extends StatelessWidget {
  const CastDetailPage({super.key});

  // final Cast cast;

  @override
  Widget build(BuildContext context) {
    final actor = context.select((MovieCubit bloc) => bloc.state.selectedActor);
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
                                      "${AppStrings.imageUrl}/${actor.profilePath}"),
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
                          Positioned(
                            child: Text(
                              actor.name,
                              style: CPTextStyle.headline(
                                  color: CPColors.white,
                                  weight: FontWeight.w900,
                                  size: 32),
                            ),
                          ),
                          Positioned(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(defaultRadiusSm),
                                  child: CachedNetworkImage(
                                    imageUrl: "${AppStrings.imageUrl}/${actor.images!.profiles.first.filePath}",
                                    height: 100,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      actor.birthday,
                                      style: CPTextStyle.caption(color: CPColors.grey500),
                                    ),
                                    const Gap(5),
                                    Text(
                                      actor.placeOfBirth,
                                      style: CPTextStyle.caption(color: CPColors.grey500),
                                    ),
                                    const Gap(5),
                                    Text(
                                      actor.knownForDepartment,
                                      style: CPTextStyle.caption(color: CPColors.pink),
                                    ),
                                  ],
                                )
                              ],
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
                          const Gap(30),
                          Text(
                            'Biography',
                            style: CPTextStyle.subTitle(color: CPColors.white),
                          ),
                          const Gap(10),
                          Text(
                            actor.biography,
                            style:
                                CPTextStyle.subTitle(color: CPColors.grey400),
                          ),
                          const Gap(50),
                          Text(
                            'Filmography',
                            style: CPTextStyle.subTitle(color: CPColors.white),
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
                                                  actor.movieCredits!.cast.map((cast) {
                                                return Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  child: FilmCard(imageUrl: cast.profilePath!, name: cast.name,),
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
            const Padding(
              padding: defaultPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      title: 'LEAVE A REVIEW',
                      isLoading: false,
                      gradient: LinearGradient(
                          colors: [CPColors.grey500, CPColors.grey800]),
                    ),
                  ),
                  Gap(10),
                  Expanded(
                      child: AppButton(
                    title: 'BOOK YOUR TICKET',
                    isLoading: false,
                   
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
