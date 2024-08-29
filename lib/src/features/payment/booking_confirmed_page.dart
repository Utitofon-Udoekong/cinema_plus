import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:jiffy/jiffy.dart';

import 'package:cinema_plus/src/components/components.dart'
    show PageHeader, BookingQRCode, BookingDetail, AppButton;
import 'package:cinema_plus/src/constants/constants.dart' show defaultPadding, AppRoutes;
import 'package:cinema_plus/src/features/booking/cubit/booking_cubit.dart';
import 'package:cinema_plus/src/features/payment/cubit/payment_cubit.dart';

class BookingConfirmedPage extends StatelessWidget {
  const BookingConfirmedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedTicket =
        context.select((PaymentCubit bloc) => bloc.state.selectedTicket);
    final jDate = Jiffy.parseFromDateTime(selectedTicket.cinema.dateTime!);
    return Scaffold(
      appBar: const PageHeader(title: 'Booking Confirmed'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: defaultPadding,
                child: Column(
                  children: [
                    BookingQRCode(selectedTicket: selectedTicket),
                    const Gap(30),
                    BookingDetail(selectedTicket: selectedTicket, jDate: jDate)
                  ],
                ),
              ),
            ),
            AppButton(
              title: 'CONTINUE',
              ontap: () {
                context.go(AppRoutes.tickets);
                context.read<PaymentCubit>().resetCard();
                context.read<BookingCubit>().reset();
              },
            ),
            const Gap(20)
          ],
        ),
      ),
    );
  }
}
