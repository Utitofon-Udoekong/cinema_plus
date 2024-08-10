import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilmCard extends StatelessWidget {
  const FilmCard({super.key, required this.imageUrl, required this.name});

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(defaultRadiusSm),
          child: CachedNetworkImage(
            imageUrl: "${AppStrings.imageUrl}/$imageUrl",
            height: 100,
            width: 80,
            fit: BoxFit.cover,
          ),
        ),
        const Gap(10),
        SizedBox(
          width: 80,
          child: Text(
            name,
            style: CPTextStyle.caption(
                color: CPColors.white, weight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
