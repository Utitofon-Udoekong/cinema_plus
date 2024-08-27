import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ChooseCinemaButton extends StatelessWidget {
  const ChooseCinemaButton({super.key, required this.cinema, this.onTap});

  final Cinema cinema;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadiusSm),
          color: Theme.of(context).colorScheme.primaryContainer,
          gradient: isDark
              ? const LinearGradient(colors: [
                  CPColors.grey600,
                  CPColors.grey500,
                  CPColors.grey800,
                ])
              : null,
          boxShadow: isDark
              ? darkShadow
              : lightShadow,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadiusSm),
              child: CachedNetworkImage(
                imageUrl: cinema.image,
                height: 50,
                width: 70,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cinema.name,
                    style:
                        CPTextStyle.caption(context, weight: FontWeight.bold),
                  ),
                  const Gap(5),
                  Text(cinema.location,
                      style:
                          CPTextStyle.caption(context, color: CPColors.grey400),
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
