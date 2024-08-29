import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/models/models.dart';

part 'booking_cubit.freezed.dart';
part 'booking_state.dart';

@lazySingleton
class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState.empty());

  selectMovie(Movie movie) => emit(state.copyWith(selectedMovie: movie));
  void chooseCinema(Cinema cinema) =>
      emit(state.copyWith(selectedCinema: cinema));
  void chooseSession(Cinema cinema) =>
      emit(state.copyWith(selectedCinema: cinema));
  void selectSeat(String seat) {
    final seats = state.selectedSeats.toList(growable: true);
    if (seats.contains(seat)) {
      seats.remove(seat);
      emit(state.copyWith(selectedSeats: seats));
    } else {
      seats.add(seat);
      emit(state.copyWith(selectedSeats: seats));
    }
  }

  void clearSeat() => emit(state.copyWith(selectedSeats: []));
  void reset() => emit(BookingState.empty());
}
