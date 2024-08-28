import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/features/movie_details/details/cast_detail_page.dart';
import 'package:cinema_plus/src/models/movie/cast/cast.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';

class CastCard extends StatelessWidget {
  const CastCard({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return OpenContainer(
      openBuilder: (context, closedContainer) {
        return const CastDetailPage();
      },
      openColor: theme.cardColor,
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),
      closedElevation: 0,
      closedColor: theme.colorScheme.surface,
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: () {
            context.read<MovieCubit>().getActor(cast.id);
            openContainer();
            // context.push(AppRoutes.castDetail);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(defaultRadiusSm),
                child: CachedNetworkImage(
                  imageUrl: "${AppStrings.imageUrl}/${cast.profilePath}",
                  height: 100,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const Gap(10),
              SizedBox(
                width: 80,
                child: Text(
                  cast.name,
                  style: CPTextStyle.caption(context, weight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
