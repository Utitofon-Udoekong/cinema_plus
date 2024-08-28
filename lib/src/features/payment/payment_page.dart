import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/home/tickets/cubit/ticket_cubit.dart';
import 'package:cinema_plus/src/features/payment/cubit/payment_cubit.dart';
import 'package:cinema_plus/src/style/style.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTicket =
        context.select((PaymentCubit bloc) => bloc.state.selectedTicket);
    final selectedCard =
        context.select((PaymentCubit bloc) => bloc.state.selectedCard);
    final creditCards =
        context.select((PaymentCubit bloc) => bloc.state.creditCards);
    return MultiBlocListener(
      listeners: [
        BlocListener<TicketCubit, TicketState>(
          listenWhen: (p, c) => c.success == 'Ticket added',
          listener: (context, state) {
            context.push(AppRoutes.bookingConfirmed);
          },
        ),
        BlocListener<PaymentCubit, PaymentState>(
          listenWhen: (p, c) => p.failure != c.failure && c.failure.isNotEmpty,
          listener: (context, state) {
            CPSnackbar.showError(context, state.failure);
          },
        ),
      ],
      child: Scaffold(
        appBar: const PageHeader(title: 'Payment'),
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
                const Gap(10),
                AppButton(
                  title: 'CONTINUE',
                  ontap: () {
                    context.read<TicketCubit>().addTicket(selectedTicket);
                  },
                  disabled: selectedCard.id.isEmpty,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
