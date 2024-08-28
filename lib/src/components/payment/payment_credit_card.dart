import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:cinema_plus/src/style/style.dart';

class PaymentCreditCard extends StatelessWidget {
  const PaymentCreditCard({
    super.key,
    required this.card,
    required this.selected,
    this.onTap,
    this.onDelete,
  });

  final CreditCard card;
  final bool selected;
  final void Function()? onTap;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(defaultRadiusMd),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Ionicons.card,
                  color: selected
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete_rounded,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
            const Spacer(),
            // CARD NUMBER
            Text(
              card.cardNumber,
              style: CPTextStyle.caption(
                context,
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const Gap(10),
            Text(
              card.cardName,
              style: CPTextStyle.body(
                context,
                weight: FontWeight.bold,
                color: selected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // EXP
                Text(
                  card.expDate,
                  style: CPTextStyle.caption(
                    context,
                    color: selected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),

                // CVV
                Text(
                  card.cvv,
                  style: CPTextStyle.caption(
                    context,
                    color: selected
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
