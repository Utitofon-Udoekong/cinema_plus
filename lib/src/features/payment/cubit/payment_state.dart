part of 'payment_cubit.dart';

@freezed
class PaymentState with _$PaymentState {
  const factory PaymentState({
    required Ticket selectedTicket,
    required bool isLoading,
    required String cardNumber,
    required String cardName,
    required String cardExpDate,
    required String cardCVV,
    required String failure,
    required String success,
    required CreditCard selectedCard,
    required List<CreditCard> creditCards
  }) = _PaymentState;

  factory PaymentState.initial() => PaymentState(
        selectedTicket: Ticket.empty(),
        isLoading: false,
        cardNumber: '',
        failure: '',
        success: '',
        cardName: '',
        cardExpDate: '',
        cardCVV: '',
        selectedCard: CreditCard.empty(),
        creditCards: []
      );
}
