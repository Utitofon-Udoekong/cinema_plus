import 'package:cinema_plus/src/components/cinema/cinema.dart';
import 'package:cinema_plus/src/components/cinema/cinema_seat.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CinemaHeader extends StatelessWidget {
  const CinemaHeader(
      {super.key,
      required this.date,
      required this.movieTitle,
      required this.cinemaName});

  final DateTime date;
  final String movieTitle;
  final String cinemaName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CinemaDate(date: date),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movieTitle,
                    style: CPTextStyle.caption(context),
                  ),
                  Text(
                    cinemaName,
                    style: CPTextStyle.link(context),
                  ),
                ],
              ),
              Row(
                children: [
                  CinemaSeat.text(context, state: CinemaSeatState.booked, text: 'BOOKED'),
                  const Gap(5),
                  CinemaSeat.text(context, state: CinemaSeatState.available, text: 'AVAILABLE'),
                  const Gap(5),
                  CinemaSeat.text(context, state: CinemaSeatState.selected, text: 'SELECTED'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
