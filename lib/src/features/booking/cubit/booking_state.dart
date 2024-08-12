part of 'booking_cubit.dart';

@freezed
class BookingState with _$BookingState {
  const factory BookingState(
      {required Cinema selectedCinema,
      required bool isLoading,
      required Movie selectedMovie}) = _BookingState;

  factory BookingState.empty() => BookingState(
        selectedCinema: cinemaList[0],
        isLoading: false,
        selectedMovie: Movie.empty(),
      );
}
