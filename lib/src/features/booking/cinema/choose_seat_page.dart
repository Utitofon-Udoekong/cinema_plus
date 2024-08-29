import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/booking/cubit/booking_cubit.dart';
import 'package:cinema_plus/src/features/payment/cubit/payment_cubit.dart';
import 'package:cinema_plus/src/models/ticket.dart';
import 'package:cinema_plus/src/style/style.dart';

class ChooseSeatPage extends StatefulWidget {
  const ChooseSeatPage({super.key});

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  double price = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      price = generateTicketPrice();
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.sizeOf(context);
    final selectedCinema =
        context.select((BookingCubit bloc) => bloc.state.selectedCinema);
    final selectedSeats =
        context.select((BookingCubit bloc) => bloc.state.selectedSeats);
    final selectedMovie =
        context.select((BookingCubit bloc) => bloc.state.selectedMovie);
    final isDark = AdaptiveTheme.of(context).mode == AdaptiveThemeMode.dark;
    return Scaffold(
      appBar: PageHeader(
        title: 'Select Seats',
        sepcialTap: () {
          context.pop();
          context.read<BookingCubit>().clearSeat();
        },
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 70,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: defaultPadding,
                decoration: BoxDecoration(
                    color: isDark ? CPColors.grey800 : CPColors.grey100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(defaultRadius),
                      topRight: Radius.circular(defaultRadius),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: CPColors.black.withOpacity(0.4),
                          offset: Offset.zero,
                          spreadRadius: 2,
                          blurRadius: 5)
                    ]),
                child: Column(
                  children: [
                    const Gap(44),

                    CustomPaint(
                      size: Size(deviceSize.width, 80),
                      painter: CustomArcPainter(
                        arcColor: Theme.of(context).colorScheme.primary,
                        shadowColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    // const Gap(30),
                    Column(
                      children: [
                        Column(
                          children: rowGroup1.map((seat) {
                            return _SeatRow(
                              row: seat,
                              availableSeats: selectedCinema.seats,
                              selectedSeats: selectedSeats,
                            );
                          }).toList(),
                        ),
                        const Gap(20),
                        Column(
                          children: rowGroup2.map((seat) {
                            return _SeatRow(
                              row: seat,
                              availableSeats: selectedCinema.seats,
                              selectedSeats: selectedSeats,
                            );
                          }).toList(),
                        ),
                        const Gap(20),
                        Column(
                          children: rowGroup3.map((seat) {
                            return _SeatRow(
                              row: seat,
                              availableSeats: selectedCinema.seats,
                              selectedSeats: selectedSeats,
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    const Gap(10),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: CinemaHeader(
                date: selectedCinema.dateTime!,
                movieTitle: selectedMovie.title,
                cinemaName: selectedCinema.name,
              ),
            ),
            Positioned(
              bottom: 15,
              left: 15,
              right: 15,
              child: CheckoutButton(
                title: 'PROCEED',
                isLoading: false,
                noOfSeats: selectedSeats.length,
                price: price,
                ontap: () {
                  final cinema = selectedCinema.copyWith(seats: selectedSeats);
                  final newTicket = Ticket(
                    bookingId: generateDocId(),
                    movie: selectedMovie,
                    cinema: cinema,
                    ticketPrice: double.parse(
                        (price * selectedSeats.length).toStringAsFixed(2)),
                  );
                  context.read<PaymentCubit>().setupTicket(newTicket);
                  context.push(AppRoutes.payment);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const rowGroup1 = [
  'A',
  'B',
  'C',
  'D',
];
const rowGroup2 = ['E', 'F', 'G'];
const rowGroup3 = ['H', 'I', 'J'];

class _SeatRow extends StatelessWidget {
  const _SeatRow(
      {required this.row,
      required this.availableSeats,
      required this.selectedSeats});

  final String row;
  final List<String> availableSeats;
  final List<String> selectedSeats;
  // final CinemaState

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 10,
            child: Text(
              row,
              style: CPTextStyle.link(context, color: CPColors.grey600),
            ),
          ),
          const Gap(15),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => CinemaSeat(
                  onTap: () => context
                      .read<BookingCubit>()
                      .selectSeat('$row${index + 1}'),
                  state: availableSeats.contains('$row${index + 1}')
                      ? selectedSeats.contains('$row${index + 1}')
                          ? CinemaSeatState.selected
                          : CinemaSeatState.available
                      : CinemaSeatState.booked,
                ),
              ),
            ),
          ),
          const Gap(30),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                4,
                (index) => CinemaSeat(
                  onTap: () => context
                      .read<BookingCubit>()
                      .selectSeat('$row${index + 5}'),
                  state: availableSeats.contains('$row${index + 5}')
                      ? selectedSeats.contains('$row${index + 5}')
                          ? CinemaSeatState.selected
                          : CinemaSeatState.available
                      : CinemaSeatState.booked,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
