import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:cinema_plus/src/constants/constants.dart';
import 'package:cinema_plus/src/domain/exceptions.dart';
import 'package:cinema_plus/src/domain/repository/user_repository.dart';
import 'package:cinema_plus/src/models/models.dart';

part 'payment_cubit.freezed.dart';
part 'payment_state.dart';

@lazySingleton
class PaymentCubit extends Cubit<PaymentState> {
  StreamSubscription<QuerySnapshot<CreditCard>>? _cardsSubscription;
  final UserRepository userRepository;
  PaymentCubit(this.userRepository) : super(PaymentState.initial()) {
    _cardsSubscription = userRepository.getCreditCards().listen(
          _subscribeToCards,
          onError: (e) => emit(
            state.copyWith(
              failure: e.toString(),
            ),
          ),
        );
  }

  _subscribeToCards(QuerySnapshot<CreditCard>? snapshot) {
    if (snapshot != null) {
      emit(state.copyWith(
          creditCards: snapshot.docs.map((ticket) => ticket.data()).toList()));
    }
  }

  void setCardNumber(String value) => emit(state.copyWith(cardNumber: value));
  void setCardExpDate(String value) => emit(state.copyWith(cardExpDate: value));
  void setCardCVV(String value) => emit(state.copyWith(cardCVV: value));
  void setCardName(String value) => emit(state.copyWith(cardName: value));
  void selectCard(CreditCard card) => emit(state.copyWith(selectedCard: card));

  void setupTicket(Ticket ticket) =>
      emit(state.copyWith(selectedTicket: ticket));

  void addCard() async {
    load();
    final cardNumber = state.cardNumber;
    final cardExpDate = state.cardExpDate;
    final cardCVV = state.cardCVV;
    final cardName = state.cardName;
    final card = CreditCard(
      id: generateDocId(),
      cardName: cardName,
      cardNumber: cardNumber,
      expDate: cardExpDate,
      cvv: cardCVV,
    );
    try {
      await userRepository.addCard(card: card);
      pass('Card added');
    } on CPException catch (e) {
      fail(e.message);
    }
  }

  void removeCard(String cardID) async {
    load();
    try {
      await userRepository.removeCard(cardID: cardID);
      pass('Card removed');
    } on CPException catch (e) {
      fail(e.message);
    }
  }

  void reset() => emit(PaymentState.initial());
  void resetCard() => emit(state.copyWith(
        cardNumber: '',
        cardExpDate: '',
        cardCVV: '',
        cardName: '',
        success: '',
        failure: '',
        selectedCard: CreditCard.empty()
      ));
  void load() => emit(state.copyWith(
        success: '',
        failure: '',
        isLoading: true,
      ));
  void pass(String message) => emit(
        state.copyWith(
          isLoading: false,
          success: message,
        ),
      );
  void fail(String message) => emit(
        state.copyWith(
          isLoading: false,
          failure: message,
        ),
      );

  @override
  Future<void> close() {
    _cardsSubscription?.cancel();
    return super.close();
  }
}
