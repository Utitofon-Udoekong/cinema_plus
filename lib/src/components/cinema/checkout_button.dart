import 'package:flutter/material.dart';

import 'package:cinema_plus/src/components/loader/app_loader_sm.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/style/style.dart';
import 'package:gap/gap.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
    required this.title,
    required this.isLoading,
    this.ontap,
    this.gradient,
    required this.noOfSeats,
    required this.price,
  });

  final String title;
  final bool isLoading;
  final Gradient? gradient;
  final int noOfSeats;
  final double price;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading ? null : ontap,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadius),
          gradient: gradient ??
              LinearGradient(
                colors: [
                  CPColors.purple,
                  Theme.of(context).colorScheme.primary
                ],
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              // width: double.infinity / 2,
              height: 58,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius),
                  gradient: gradient ??
                      const LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          Color.fromARGB(255, 212, 56, 186)
                        ],
                      ),
                  boxShadow: [
                    BoxShadow(
                        color: CPColors.black.withOpacity(0.3),
                        offset: const Offset(5, 0),
                        blurRadius: 3)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '\$${(noOfSeats * price).toStringAsFixed(2)}',
                    style: CPTextStyle.subTitle(context,
                        weight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  Text(
                    '$noOfSeats TICKET(S) FOR \$${price.toStringAsFixed(2)} EACH',
                    style: CPTextStyle.link(context,
                        size: 10,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                ],
              ),
            ),
            isLoading
                ? const AppLoaderSM()
                : Text(
                    'PROCEED TO BUY',
                    style: CPTextStyle.button(context,
                        color: Theme.of(context).colorScheme.onSecondary),
                    textAlign: TextAlign.center,
                  ),
            const Gap(0)
          ],
        ),
      ),
    );
  }
}
