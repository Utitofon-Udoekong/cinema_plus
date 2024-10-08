part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required Email email,
    required Password password,
    required ConfirmedPassword confirmedPassword,
    required FormzSubmissionStatus status,
    required bool isValid,
    required bool obscureText,
    required String? errorMessage,
    required AppUser user
  }) = _AuthState;

  factory AuthState.initial() {
    return AuthState(
      email: const Email.pure(),
      password: const Password.pure(),
      confirmedPassword: const ConfirmedPassword.pure(),
      status: FormzSubmissionStatus.initial,
      isValid: false,
      obscureText: true,
      errorMessage: null,
      user: AppUser.empty()
    );
  }
}
