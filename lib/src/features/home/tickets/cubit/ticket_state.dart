part of 'ticket_cubit.dart';

@freezed
class TicketState with _$TicketState {
  const factory TicketState({
    required List<Ticket> tickets,
    required bool isLoading,
    required String failure,
    required String success,
  }) = _TicketState;

  factory TicketState.initial() => TicketState(
        tickets: [],
        isLoading: false,
        failure: '',
        success: ''
      );
}
