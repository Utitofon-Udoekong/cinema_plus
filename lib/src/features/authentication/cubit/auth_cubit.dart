import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_inputs/form_inputs.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:cinema_plus/src/domain/exceptions.dart';
import 'package:cinema_plus/src/domain/repository/auth_repository.dart';
import 'package:cinema_plus/src/models/app_user.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  StreamSubscription<AppUser>? _authUserSubscription;
  StreamSubscription<AppUser>? _databaseUserSubscription;
  final AuthenticationRepository _authenticationRepository;

  AuthCubit(this._authenticationRepository) : super(AuthState.initial()) {
    _authUserSubscription = _authenticationRepository.authStateChanges
        .listen(listenAuthStateChangesStream);
  }

  void obscureText() {
    final isObscured = state.obscureText;
    if (isObscured) {
      emit(state.copyWith(obscureText: false));
    } else {
      emit(state.copyWith(obscureText: true));
    }
  }

  Future<void> listenAuthStateChangesStream(AppUser authUser) async {
    if (authUser != AppUser.empty()) {
      emit(
        state.copyWith(
          user: authUser,
        ),
      );
      await startDatabaseUserSubscriptionIfPossible();
    } else {
      emit(
        state.copyWith(
          user: authUser,
        ),
      );
    }
  }

  Future<void> startDatabaseUserSubscriptionIfPossible() async {
    await _databaseUserSubscription?.cancel();

    if (state.user != AppUser.empty()) {
      _databaseUserSubscription = _authenticationRepository
          .firestoreChanges(uid: state.user.uid)
          .listen(
        (AppUser databaseUser) {
          emit(
            state.copyWith(user: databaseUser),
          );
        },
      );
    }
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        isValid: Formz.validate([email, state.password]),
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        isValid: Formz.validate([state.email, password]),
      ),
    );
  }

  void confirmedPasswordChanged(String value) {
    final confirmedPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(
      state.copyWith(
        confirmedPassword: confirmedPassword,
        isValid: Formz.validate([
          state.email,
          state.password,
          confirmedPassword,
        ]),
      ),
    );
  }

  Future<void> logInWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> signUp() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.signUp(
        email: state.email.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  void reset() => emit(AuthState.initial());
}
