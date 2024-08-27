import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/constants/app_strings.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/style/text/cp_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class FilmCard extends StatelessWidget {
  const FilmCard({super.key, required this.imageUrl, required this.name});

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(defaultRadiusSm),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(defaultRadiusSm),
            child: CachedNetworkImage(
              imageUrl: "${AppStrings.imageUrl}$imageUrl",
              height: 280,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(5),
          Container(
            padding: const EdgeInsets.all(5),
            width: 150,
            child: Text(
              name,
              style: CPTextStyle.caption(context, weight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
