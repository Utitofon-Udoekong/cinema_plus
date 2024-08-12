import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class CinemaDate extends StatelessWidget {
  const CinemaDate({
    super.key,
    required this.date,
  });

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final jDate = Jiffy.parseFromDateTime(date);
    return ClipRRect(
      borderRadius: BorderRadius.circular(defaultRadiusSm),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  CPColors.purple,
                  CPColors.pink,
                ])),
            child: Column(
              children: [
                Text(
                  jDate.date.toString(),
                  style: CPTextStyle.caption(context),
                ),
                Text(
                  jDate.EEEE,
                  style: CPTextStyle.link(context),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  CPColors.grey600,
                  CPColors.grey800,
                ])),
            child: Column(
              children: [
                Text(
                  jDate.Hm,
                  style: CPTextStyle.caption(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
