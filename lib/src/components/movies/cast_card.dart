import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/core/router/router.gr.dart';
import 'package:cinema_plus/src/features/home/movies/cubit/movie_cubit.dart';
import 'package:cinema_plus/src/models/movie/cast/cast.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CastCard extends StatelessWidget {
  const CastCard({super.key, required this.cast});

  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<MovieCubit>().getActor(cast.id);
        context.pushRoute(const CastDetailRoute());
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
              style: CPTextStyle.caption(
                  color: CPColors.white, weight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
