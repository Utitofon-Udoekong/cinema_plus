import 'package:bloc/bloc.dart';
import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:cinema_plus/src/models/movie/movie.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'booking_state.dart';
part 'booking_cubit.freezed.dart';

@lazySingleton
class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingState.empty());

  selectMovie(Movie movie) => emit(state.copyWith(selectedMovie: movie));
  void chooseCinema(Cinema cinema) =>
      emit(state.copyWith(selectedCinema: cinema));
  void chooseSession(Cinema cinema) =>
      emit(state.copyWith(selectedCinema: cinema));

  void selectSeats(String seat) {
    final cinema = state.selectedCinema;
    final seats = cinema.seats;
    if (seats.contains(seat)) {
      seats.remove(seat);
      cinema.seats = seats;
      emit(state.copyWith(selectedCinema: cinema));
    }else{
      seats.add(seat);
      cinema.seats = seats;
      emit(state.copyWith(selectedCinema: cinema));
    }
  }
}
