import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart' show defaultPadding, AppRoutes, WidgetSpace;
import 'package:cinema_plus/src/features/payment/cubit/payment_cubit.dart';
import 'package:cinema_plus/src/style/style.dart' show CPTextStyle;

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCard =
        context.select((PaymentCubit bloc) => bloc.state.selectedCard);
    final creditCards =
        context.select((PaymentCubit bloc) => bloc.state.creditCards);
    return Scaffold(
      appBar: const PageHeader(title: 'Payment Methods'),
      body: SafeArea(
        child: Padding(
          padding: defaultPadding,
          child: Column(
            children: [
              if (creditCards.isEmpty)
                Text(
                  'No payment method found',
                  style: CPTextStyle.caption(
                    context,
                  ),
                ),
              Expanded(
                child: ListView(
                  children: creditCards.map((card) {
                    return PaymentCreditCard(
                      card: card,
                      selected: selectedCard.id == card.id,
                      onTap: () =>
                          context.read<PaymentCubit>().selectCard(card),
                      onDelete: () =>
                          context.read<PaymentCubit>().removeCard(card.id),
                    );
                  }).withSpacing(10),
                ),
              ),
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
