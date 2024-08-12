import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:cinema_plus/src/components/cinema/choose_cinema_tile.dart';
import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/booking/cubit/booking_cubit.dart';
import 'package:cinema_plus/src/style/style.dart';

@RoutePage()
class ChooseSessionPage extends StatefulWidget {
  const ChooseSessionPage({super.key});

  @override
  State<ChooseSessionPage> createState() => _ChooseSessionPageState();
}

class _ChooseSessionPageState extends State<ChooseSessionPage> {
  String selectedTime = '';
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final selectedCinema =
        context.select((BookingCubit bloc) => bloc.state.selectedCinema);
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
        child: Padding(
          padding: defaultPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(30),
                      Text(
                        'Choose cinema',
                        style: CPTextStyle.caption(context, weight: FontWeight.bold),
                      ),
                      const Gap(5),
                      ChooseCinemaButton(
                        cinema: selectedCinema,
                        onTap: () => showChooseCinemaModal,
                      ),
                      const Gap(30),
                      Text(
                        'Choose Date',
                        style: CPTextStyle.caption(context, weight: FontWeight.bold),
                      ),
                      const Gap(5),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: getAvailableDays().map((day) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedDate = day;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  child: DateChip(
                                      isSelected: selectedDate == day, date: day),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const Gap(30),
                      Text(
                        'Choose Time',
                        style: CPTextStyle.caption(context, weight: FontWeight.bold),
                      ),
                      const Gap(10),
                      Text(
                        'CLASSIC SESSION',
                        style: CPTextStyle.link(context, color: CPColors.grey500),
                      ),
                      const Gap(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _classicSession.map((time) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTime = time;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: TimeChip(
                                  isSelected: selectedTime == time,
                                  time: selectedTime),
                            ),
                          );
                        }).toList(),
                      ),
                      const Gap(10),
                      Text(
                        '3D SESSION',
                        style: CPTextStyle.link(context, color: CPColors.grey500),
                      ),
                      const Gap(10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: _3dSession.map((time) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedTime = time;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: TimeChip(
                                  isSelected: selectedTime == time,
                                  time: selectedTime),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
              AppButton(title: 'CHOOSE SESSION', isLoading: false,
              ontap: () {
                final newCinema = selectedCinema.copyWith(dateTime: DateTime.parse('${selectedDate.toIso8601String().substring(0,10)} $selectedTime'));
                context.read<BookingCubit>().chooseSession(newCinema);
              },)
            ],
          ),
        ),
      ),
    );
  }
}

const _classicSession = [
  "17:15",
  "19:00",
  "20:45",
  "21:50",
  "23:05",
];
const _3dSession = [
  "19:30",
  "21:35",
  "23:05",
];
showChooseCinemaModal(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      enableDrag: false,
      builder: (context) {
        return const _ChooseCinemaModal();
      });
}

class _ChooseCinemaModal extends StatelessWidget {
  const _ChooseCinemaModal({super.key});
  @override
  Widget build(BuildContext context) {
    final selectedCinema =
        context.select((BookingCubit bloc) => bloc.state.selectedCinema);
    return SingleChildScrollView(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Select Cinema',
                    style:
                        CPTextStyle.caption(context, weight: FontWeight.bold),
                  ),
                  ...cinemaList.map(
                    (cinema) => ChooseCinemaTile(
                      cinema: cinema,
                      isSelected: selectedCinema.location == cinema.location,
                      onTap: () =>
                          context.read<BookingCubit>().chooseCinema(cinema),
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppButton(
            title: 'CHOOSE CINEMA',
            isLoading: false,
            ontap: () => context.maybePop(),
          )
        ],
      ),
    );
  }
}
