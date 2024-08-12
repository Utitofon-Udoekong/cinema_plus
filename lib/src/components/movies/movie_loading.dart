import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:cinema_plus/src/style/color/cp_color.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MovieLoading extends StatelessWidget {
  const MovieLoading();

  @override
  Widget build(BuildContext context) {
    return _CastCard();
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard();

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadiusSm),
            color: CPColors.grey600,
          ),
          width: 150,
          height: 270,
        );
  }
}