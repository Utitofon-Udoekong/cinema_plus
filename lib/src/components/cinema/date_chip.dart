import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class DateChip extends StatelessWidget {
  const DateChip({super.key, required this.isSelected, required this.date});

  final bool isSelected;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final jDate = Jiffy.parseFromDateTime(date);
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? null : CPColors.grey600.withOpacity(0.4),
        border: Border.all(color: CPColors.grey600),
        borderRadius: BorderRadius.circular(defaultRadiusSm),
        gradient: isSelected
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  CPColors.grey700,
                  CPColors.grey800,
                ],
              )
            : null,
        boxShadow: isSelected
            ? const [
                BoxShadow(
                    color: CPColors.black,
                    offset: Offset(-3, 2),
                    blurRadius: 5),
                BoxShadow(
                    color: CPColors.black,
                    offset: Offset(-10, 0),
                    spreadRadius: 10,
                    blurRadius: 5),
                BoxShadow(
                    color: CPColors.black, offset: Offset(3, 2), blurRadius: 5),
              ]
            : null,
      ),
      alignment: Alignment.center,
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
    );
  }
}
