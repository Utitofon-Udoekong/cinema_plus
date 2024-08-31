import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:cinema_plus/src/components/components.dart' show BookingDetail;
import 'package:cinema_plus/src/features/home/tickets/cubit/ticket_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';

import 'package:cinema_plus/src/constants/constants.dart'
    show defaultRadiusSm, defaultPadding;
import 'package:cinema_plus/src/models/models.dart' show Ticket;
import 'package:cinema_plus/src/style/style.dart' show CPTextStyle, CPColors;

import '../booking/booking_detail.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({super.key, required this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    final jDate = Jiffy.parseFromDateTime(ticket.cinema.dateTime!);
    final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            scrollControlDisabledMaxHeightRatio: 0.7,
            builder: (context) {
              return SingleChildScrollView(
                child: BookingDetail(
                  selectedTicket: ticket,
                  jDate: jDate,
                  canDelete: true,
                  onDelete: () {
                    context.read<TicketCubit>().removeTicket(ticket.bookingId);
                    context.pop();
                  },
                ),
              );
            });
      },
      child: SizedBox(
        height: 120,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                padding: defaultPadding,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  // border: Border.all(color: CPColors.grey500),
                  borderRadius: BorderRadius.circular(defaultRadiusSm),
                  boxShadow: isDark
                      ? [
                          BoxShadow(
                              color: CPColors.black.withOpacity(0.7),
                              offset: const Offset(0, 6),
                              spreadRadius: 3,
                              blurRadius: 8)
                        ]
                      : [],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ticket.movie.title,
                            style: CPTextStyle.subTitle(
                              context,
                              weight: FontWeight.bold,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onPrimaryContainer,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Gap(8),
                          _TextTile(
                              title: 'DATE & TIME',
                              body: '${jDate.MMMMd} • ${jDate.Hm}')
                        ],
                      ),
                    ),
                    const Gap(10),
                    const VerticalDivider(
                      color: CPColors.grey500,
                    ),
                    const Gap(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _TextTile(
                                  title: 'HALL', body: ticket.cinema.hall),
                              const Gap(20),
                              Expanded(
                                child: _TextTile(
                                    title: 'SEATS',
                                    body: ticket.cinema.seats
                                        .asMap()
                                        .values
                                        .join(', ')),
                              ),
                            ],
                          ),
                          const Gap(10),
                          _TextTile(title: 'CINEMA', body: ticket.cinema.name)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            if (jDate.isSame(Jiffy.now()))
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'TODAY',
                    style: CPTextStyle.link(
                      context,
                      size: 10,
                      color: CPColors.white,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (Jiffy.now().isAfter(jDate))
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                      color: CPColors.grey700,
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    'EXPIRED',
                    style: CPTextStyle.link(
                      context,
                      size: 10,
                      color: CPColors.white,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _TextTile extends StatelessWidget {
  const _TextTile({super.key, required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              CPTextStyle.caption(context, color: CPColors.grey500, size: 10),
        ),
        Text(
          body,
          style: CPTextStyle.caption(context,
              color: Theme.of(context).colorScheme.onPrimaryContainer),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
