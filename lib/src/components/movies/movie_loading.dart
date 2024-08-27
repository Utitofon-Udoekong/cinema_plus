import 'package:flutter/material.dart';
import 'package:cinema_plus/src/constants/arb_styles.dart';

class MovieLoading extends StatelessWidget {
  const MovieLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const _CastCard();
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard();

  @override
  Widget build(BuildContext context) {
    return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadiusSm),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          width: 150,
          height: 270,
        );
  }
}