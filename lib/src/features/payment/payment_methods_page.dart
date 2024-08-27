import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/payment/cubit/payment_cubit.dart';
import 'package:cinema_plus/src/style/style.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final selectedCard =
        context.select((PaymentCubit bloc) => bloc.state.selectedCard);
    final creditCards =
        context.select((PaymentCubit bloc) => bloc.state.creditCards);
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: const PageHeader(title: 'Payment Methods'),
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              if (creditCards.isEmpty)
                Text(
                  'No payment method found',
                  style: CPTextStyle.caption(
                    context,
                  ),
                ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  itemExtent: size.width - defaultPadding.horizontal,
                  children: creditCards.map((card) {
                    return PaymentCreditCard(
                      card: card,
                      selected: selectedCard.id == card.id,
                      onTap: () => context.read<PaymentCubit>().selectCard(card),
                    );
                  }).withSpacing(10),
                ),
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () => context.push(AppRoutes.addCard),
                label: Text(
                  'ADD PAYMENT METHOD',
                  style: CPTextStyle.caption(
                    context,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
