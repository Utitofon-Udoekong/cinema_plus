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
      onTap: onTap,
      child: child ??
          Icon(
            Icons.chair_rounded,
            color: getChairColor(state),
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
            color: getChairColor(state),
          ),
          const Gap(5),
          Text(
            text,
            style: CPTextStyle.link(context, color: CPColors.grey700),
          ),
        ],
      ),
    );
  }
}

enum CinemaSeatState { booked, available, selected }

Color getChairColor(CinemaSeatState state) {
  switch (state) {
    case CinemaSeatState.available:
      return CPColors.grey100;
    case CinemaSeatState.booked:
      return CPColors.grey700;
    case CinemaSeatState.selected:
      return CPColors.pink;
    default:
      return CPColors.grey100;
  }
}
