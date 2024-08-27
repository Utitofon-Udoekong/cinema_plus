import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:cinema_plus/src/style/style.dart';

class ChooseCinemaTile extends StatelessWidget {
  const ChooseCinemaTile(
      {super.key, required this.cinema, required this.isSelected, this.onTap});

  final Cinema cinema;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(defaultRadiusSm),
        ),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadiusSm),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(defaultRadiusSm),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: cinema.image,
                        height: 50,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    isSelected
                        ? Positioned.fill(
                            child: Container(
                              color: Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.7),
                            ),
                          )
                        : const Gap(0),
                    isSelected
                        ? const Positioned.fill(
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: CPColors.white,
                              ),
                            ),
                          )
                        : const Gap(0),
                  ],
                ),
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
                  Text(
                    cinema.location,
                    style:
                        CPTextStyle.caption(context, color: CPColors.grey400),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
