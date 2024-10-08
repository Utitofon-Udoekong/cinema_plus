import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CinemaSeat extends StatelessWidget {
  const CinemaSeat({super.key, required this.state, this.onTap, this.child});

  final CinemaSeatState state;
  final void Function()? onTap;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: state == CinemaSeatState.booked ? null : onTap,
      child: child ??
          Icon(
            Icons.chair_rounded,
            color: getChairColor(state, context),
            size: 20,
          ),
    );
  }

  factory CinemaSeat.text(
    BuildContext context,{
    Key? key,
    void Function()? onTap,
    required CinemaSeatState state,
    required String text,
  }) {
    return CinemaSeat(
      state: state,
      child: Row(
        children: [
          Icon(
            Icons.chair_rounded,
            color: getChairColor(state, context),
            size: 20,
          ),
          const Gap(5),
          Text(
            text,
            style: CPTextStyle.link(context, color: CPColors.grey600, size: 10),
          ),
        ],
      ),
    );
  }
}


