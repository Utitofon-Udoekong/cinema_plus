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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: CPColors.grey600,
          border: Border.all(color: CPColors.grey400),
          gradient: const LinearGradient(colors: [
            CPColors.grey600,
            CPColors.grey400,
            CPColors.grey600,
          ]),
          boxShadow: const [
            BoxShadow(
                color: CPColors.black, offset: Offset(-3, 2), blurRadius: 5),
            BoxShadow(
                color: CPColors.black,
                offset: Offset(-10, 0),
                spreadRadius: 10,
                blurRadius: 5),
            BoxShadow(
                color: CPColors.black, offset: Offset(3, 2), blurRadius: 5),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(defaultRadiusSm),
              child: CachedNetworkImage(
                imageUrl: cinema.image,
                height: 100,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cinema.name,
                  style: CPTextStyle.caption(color: CPColors.white, weight: FontWeight.bold),
                ),
                const Gap(5),
                Text(
                  cinema.location,
                  style: CPTextStyle.caption(color: CPColors.grey400),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
