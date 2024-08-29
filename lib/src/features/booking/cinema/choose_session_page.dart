import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import 'package:cinema_plus/src/components/components.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/features/booking/cubit/booking_cubit.dart';
import 'package:cinema_plus/src/style/style.dart';

class ChooseSessionPage extends StatefulWidget {
  const ChooseSessionPage({super.key});

  @override
  State<ChooseSessionPage> createState() => _ChooseSessionPageState();
}

class _ChooseSessionPageState extends State<ChooseSessionPage> {
  String selectedTime = _classicSession.first;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final selectedCinema =
        context.select((BookingCubit bloc) => bloc.state.selectedCinema);
    return Scaffold(
      appBar: const PageHeader(
        title: 'Choose Session',
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
                        style: CPTextStyle.caption(context,
                            weight: FontWeight.bold),
                      ),
                      const Gap(10),
                      ChooseCinemaButton(
                        cinema: selectedCinema,
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              barrierColor: CPColors.grey600.withOpacity(0.6),
                              builder: (context) {
                                return const _ChooseCinemaModal();
                              });
                        },
                      ),
                      const Gap(30),
                      Text(
                        'Choose Date',
                        style: CPTextStyle.caption(context,
                            weight: FontWeight.bold),
                      ),
                      const Gap(5),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
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
                                      isSelected: selectedDate.day == day.day,
                                      date: day),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const Gap(30),
                      Text(
                        'Choose Time',
                        style: CPTextStyle.caption(context,
                            weight: FontWeight.bold),
                      ),
                      const Gap(10),
                      Text(
                        'CLASSIC SESSION',
                        style:
                            CPTextStyle.link(context, color: CPColors.grey500),
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
                                  isSelected: selectedTime == time, time: time),
                            ),
                          );
                        }).toList(),
                      ),
                      const Gap(10),
                      Text(
                        '3D SESSION',
                        style:
                            CPTextStyle.link(context, color: CPColors.grey500),
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
                                  isSelected: selectedTime == time, time: time),
                            ),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
              ),
              Hero(
                tag: 'movie-detail-to-session',
                child: AppButton(
                  title: 'CHOOSE SESSION',
                  ontap: () {
                    final cinemaDate = DateTime.parse(
                        '${selectedDate.toIso8601String().substring(0, 10)} $selectedTime');
                    final newCinema =
                        selectedCinema.copyWith(dateTime: cinemaDate);
                    context.read<BookingCubit>().chooseSession(newCinema);
                    context.push(AppRoutes.chooseSeat);
                  },
                ),
              )
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
  "23:45",
];

class _ChooseCinemaModal extends StatelessWidget {
  const _ChooseCinemaModal();
  @override
  Widget build(BuildContext context) {
    final selectedCinema =
        context.select((BookingCubit bloc) => bloc.state.selectedCinema);
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: 0.75,
        minChildSize: 0.7,
        maxChildSize: 0.75,
        builder: (_, controller) {
          return Container(
            padding: defaultPadding,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultRadius),
              topRight: Radius.circular(defaultRadius),
            )),
            child: Column(
              children: [
                const Gap(30),
                Text(
                  'Select Cinema',
                  style: CPTextStyle.body(context, weight: FontWeight.bold),
                ),
                const Gap(10),
                Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: cinemaList.length,
                    itemBuilder: (context, index) {
                      final cinema = cinemaList[index];
                      return ChooseCinemaTile(
                        cinema: cinema,
                        isSelected: selectedCinema.location == cinema.location,
                        onTap: () =>
                            context.read<BookingCubit>().chooseCinema(cinema),
                      );
                    },
                  ),
                ),
                const Gap(10),
                AppButton(
                  title: 'CHOOSE CINEMA',
                  ontap: () => context.pop(),
                ),
              ],
            ),
          );
        });
  }
}
