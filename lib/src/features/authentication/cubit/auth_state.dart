part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required Email email,
    required Password password,
    required ConfirmedPassword confirmedPassword,
    required FormzSubmissionStatus status,
    required bool isValid,
    required String? errorMessage,
    required AppUser user
  }) = _AuthState;

  factory AuthState.initial() {
    return AuthState(
      email: Email.pure(),
      password: Password.pure(),
      confirmedPassword: ConfirmedPassword.pure(),
      status: FormzSubmissionStatus.initial,
      isValid: false,
      errorMessage: null,
      user: AppUser.empty()
    );
  }
}
