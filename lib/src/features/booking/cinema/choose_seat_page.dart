import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:cinema_plus/src/components/cinema/cinema_seat.dart';
import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/booking/cubit/booking_cubit.dart';
import 'package:cinema_plus/src/style/style.dart';

@RoutePage()
class ChooseSeatPage extends StatefulWidget {
  const ChooseSeatPage({super.key});

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  String selectedSeat = "";
  @override
  Widget build(BuildContext context) {
    final selectedCinema =
        context.select((BookingCubit bloc) => bloc.state.selectedCinema);
    final selectedMovie =
        context.select((BookingCubit bloc) => bloc.state.selectedMovie);
    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        centerTitle: true,
        title: Text(
          'Choose Session',
          style: CPTextStyle.body(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            CinemaHeader(
              date: selectedCinema.dateTime!,
              movieTitle: selectedMovie.title,
              cinemaName: selectedCinema.name,
            ),
            // showModalBottomSheet(context: context, builder: builder)
            // Expanded(
            //     child: SingleChildScrollView(
            //   child: Column(
            //     children: [],
            //   ),
            // )),
            // AppButton(title: 'PROCEED TO CHECKOUT', isLoading: false),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: defaultPadding,
        child: Column(
          children: [
            // LINE OVER SEATS
            Column(
              children: [
                Column(
                  children: rows.map((row) {
                    return _SeatRow(
                      row: row,
                      availableSeats: selectedCinema.seats,
                      selectedSeat: selectedSeat,
                    );
                  }).toList(),
                ),
              ],
            ),
            const Gap(10),
            const AppButton(title: 'PROCEED TO CHECKOUT', isLoading: false)
          ],
        ),
      ),
    );
  }
}

const rows = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

class _SeatRow extends StatelessWidget {
  const _SeatRow(
      {super.key,
      this.isThree = false,
      this.ontap,
      required this.row,
      required this.availableSeats,
      required this.selectedSeat});

  final bool isThree;
  final void Function()? ontap;
  final String row;
  final List<String> availableSeats;
  final String selectedSeat;
  // final CinemaState

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              row,
              style: CPTextStyle.link(context, color: CPColors.grey600),
            ),
            const Gap(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              textDirection: TextDirection.rtl,
              children: List.generate(
                isThree ? 3 : 4,
                (index) => CinemaSeat(
                  onTap: ontap,
                  state: availableSeats.contains('$row${index + 1}')
                      ? selectedSeat == '$row${index + 1}'
                          ? CinemaSeatState.selected
                          : CinemaSeatState.booked
                      : CinemaSeatState.available,
                ),
              ),
            )
          ],
        ),
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            isThree ? 3 : 4,
            (index) => CinemaSeat(
              onTap: ontap,
              state: availableSeats.contains('$row${index + 5}')
                  ? selectedSeat == '$row${index + 1}'
                      ? CinemaSeatState.selected
                      : CinemaSeatState.booked
                  : CinemaSeatState.available,
            ),
          ),
        )
      ],
    );
  }
}
