import 'package:cinema_plus/src/constants/arb_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CastLoading extends StatelessWidget {
  const CastLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final ratio = (width / 120).ceil();
    return Row(
      children: List.generate(ratio, (index) {
        if (index < ratio - 1) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: const _CastCard(),
          );
        } else {
          return const _CastCard();
        }
      }),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(defaultRadiusSm),
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          width: 80,
          height: 100,
        ),
        const Gap(10),
        Container(
          height: 10,
          width: 80,
          color: Theme.of(context).colorScheme.primaryContainer,
        )
      ],
    );
  }
}
