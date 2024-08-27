import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:cinema_plus/src/style/style.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CastDetailPage extends StatelessWidget {
  const CastDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final actor = context.select((MovieCubit bloc) => bloc.state.selectedActor);
    final isLoading =
        context.select((MovieCubit bloc) => bloc.state.isCastLoading);
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : actor == Actor.empty()
                ? Text(
                    'Data not available',
                    style:
                        CPTextStyle.caption(context, color: CPColors.grey400),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 320,
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
                              const Positioned(
                                  top: 20, left: 15, child: AppBackButton()),
                              Positioned(
                                top: 130,
                                left: 15,
                                child: Text(
                                  actor.name,
                                  style: CPTextStyle.headline(context,
                                      weight: FontWeight.w900, size: 32),
                                ),
                              ),
                              Positioned(
                                top: 200,
                                left: 15,
                                right: 15,
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          defaultRadiusSm),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "${AppStrings.imageUrl}/${actor.images!.profiles[1].filePath}",
                                        height: 100,
                                        width: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Gap(10),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            actor.birthday,
                                            style: CPTextStyle.caption(context,
                                                color: CPColors.grey400),
                                          ),
                                          const Gap(5),
                                          Text(
                                            actor.placeOfBirth ?? '',
                                            style: CPTextStyle.caption(context,
                                                color: CPColors.grey400),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          const Gap(5),
                                          Text(
                                            actor.knownForDepartment,
                                            style: CPTextStyle.caption(context,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                          ),
                                        ],
                                      ),
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
                                style: CPTextStyle.subTitle(
                                  context,
                                ),
                              ),
                              const Gap(10),
                              Text(
                                actor.biography,
                                style: CPTextStyle.subTitle(context,
                                    color: CPColors.grey400),
                              ),
                              const Gap(50),
                              Text(
                                'Filmography',
                                style: CPTextStyle.subTitle(
                                  context,
                                ),
                              ),
                              const Gap(10),
                              BlocBuilder<MovieCubit, MovieState>(
                                builder: (context, state) {
                                  return state.isCastLoading
                                      ? const FilmLoading()
                                      : state.movieCast.isEmpty
                                          ? Text(
                                              'Data not available',
                                              style: CPTextStyle.caption(
                                                  context,
                                                  color: CPColors.grey400),
                                            )
                                          : SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: actor
                                                      .movieCredits!.cast
                                                      .where((movie) =>
                                                          movie.backdropPath !=
                                                          null)
                                                      .map((movie) {
                                                    return FilmCard(
                                                      imageUrl:
                                                          movie.backdropPath!,
                                                      name: movie.title,
                                                    );
                                                  }).withSpacing(10),
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
    );
  }
}
