import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';

class CinemaDate extends StatelessWidget {
  const CinemaDate({super.key, required this.date, required this.day, required this.time});

  final String date;
  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
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
                ]
              )
            ),
            child: Column(
              children: [
                Text(date,style: CPTextStyle.caption(color: CPColors.white),),
                Text(day,style: CPTextStyle.link(color: CPColors.white),),
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
                ]
              )
            ),
            child: Column(
              children: [
                Text(time,style: CPTextStyle.caption(color: CPColors.white),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
