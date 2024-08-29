import 'package:cinema_plus/src/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cinema_plus/src/components/components.dart'
    show TicketCard, PageHeader;
import 'package:cinema_plus/src/constants/constants.dart'
    show WidgetSpace, defaultPadding;
import 'package:cinema_plus/src/features/home/tickets/cubit/ticket_cubit.dart';

class TicketsPage extends StatelessWidget {
  const TicketsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tickets = context.select((TicketCubit bloc) => bloc.state.tickets);

    return Scaffold(
      appBar: const PageHeader(
        title: 'Tickets',
        showBack: false,
      ),
      body: SafeArea(
        child: ListView(
          padding: defaultPadding,
          children: tickets.isEmpty
              ? [
                  Center(
                    child: Text(
                      'No tickets found',
                      style: CPTextStyle.caption(
                        context,
                      ),
                    ),
                  )
                ]
              : tickets
                  .map((ticket) => TicketCard(
                        ticket: ticket,
                      ))
                  .withSpacing(10),
        ),
      ),
    );
  }
}
