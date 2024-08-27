import 'dart:async';

import 'package:cinema_plus/src/core/bloc_observer.dart';
import 'package:cinema_plus/src/domain/exceptions.dart';
import 'package:cinema_plus/src/domain/repository/ticket_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'ticket_state.dart';
part 'ticket_cubit.freezed.dart';

@lazySingleton
class TicketCubit extends Cubit<TicketState> {
  StreamSubscription<QuerySnapshot<Ticket>>? _ticketsSubscription;
  final TicketRepository _ticketRepository;

  TicketCubit(this._ticketRepository) : super(TicketState.initial()) {
    _ticketsSubscription = _ticketRepository.getTickets().listen(
          _subscribeToTickets,
          onError: (e) => emit(
            state.copyWith(
              failure: e.toString(),
            ),
          ),
        );
  }

  _subscribeToTickets(QuerySnapshot<Ticket>? snapshot) {
    if (snapshot != null) {
      emit(state.copyWith(
          tickets: snapshot.docs.map((ticket) => ticket.data()).toList()));
    }
  }

  void addTicket(Ticket ticket) async {
    load();
    try {
      await _ticketRepository.addTicket(ticket: ticket);
      pass('Ticket added');
    } on CPException catch (e) {
      logger.e(e.message);
      fail(e.message);
    }
  }

  void removeTicket(String bookingID) async {
    load();
    try {
      await _ticketRepository.removeTicket(bookingID: bookingID);
      pass('Ticket removed');
    } on CPException catch (e) {
      logger.e(e.message);
      fail(e.message);
    }
  }

  void reset() => emit(TicketState.initial());

  void load() => emit(state.copyWith(
        isLoading: true,
        success: '',
        failure: '',
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
    _ticketsSubscription?.cancel();
    return super.close();
  }
}
