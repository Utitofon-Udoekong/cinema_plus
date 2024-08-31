import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
/// {@template sign_up_with_email_and_password_failure}
/// Thrown during the sign up process if a failure occurs.
/// {@endtemplate}
class SignUpWithEmailAndPasswordFailure implements Exception {
  /// {@macro sign_up_with_email_and_password_failure}
  const SignUpWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  /// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/createUserWithEmailAndPassword.html
  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
          'An account already exists for that email.',
        );
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
          'Operation is not allowed.  Please contact support.',
        );
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
          'Please enter a stronger password.',
        );
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// {@template log_in_with_email_and_password_failure}
/// Thrown during the login process if a failure occurs.
/// https://pub.dev/documentation/firebase_auth/latest/firebase_auth/FirebaseAuth/signInWithEmailAndPassword.html
/// {@endtemplate}
class LogInWithEmailAndPasswordFailure implements Exception {
  /// {@macro log_in_with_email_and_password_failure}
  const LogInWithEmailAndPasswordFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not valid or badly formatted.',
        );
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
          'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
        return const LogInWithEmailAndPasswordFailure(
          'Email is not found, please create an account.',
        );
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
          'Incorrect password, please try again.',
        );
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  /// The associated error message.
  final String message;
}

/// Thrown during the logout process if a failure occurs.
class LogOutFailure implements Exception {}



/// Thrown during a network request if a failure occurs.
class CPException implements Exception {
  final String message;

  CPException(this.message);
  /// Create an authentication message
  /// from a firebase authentication exception code.
  factory CPException.auth(FirebaseAuthException e) {
    switch (e.code) {
      case 'weak-password':
        return CPException('Password is too weak.');
      case 'email-already-in-use':
        return CPException('Email address is already in use.');
      case 'invalid-email':
        return CPException('Invalid email address.');
      case 'user-not-found':
        return CPException('User not found.');
      case 'wrong-password':
        return CPException('Wrong password.');
      case 'operation-not-allowed':
        return CPException('Operation not allowed.');
      case 'too-many-requests':
        return CPException('Too many requests.');
      case 'requires-recent-login':
        return CPException('Requires recent login.');
      case 'invalid-verification-code':
        return CPException('Invalid verification code.');
      case 'invalid-credential':
        return CPException('Invalid credential.');
      case 'user-disabled':
        return CPException('User disabled.');
      case 'email-already-exists':
        return CPException('Email already exists.');
      case 'operation-aborted':
        return CPException('Operation aborted.');
      case 'weak-password-policy':
        return CPException('Weak password policy.');
      case 'network-request-failed':
        return CPException('Network request failed.');
      default:
        return CPException('Unknown error: ${e.code}');
    }
  }

  factory CPException.firestore(FirebaseException e) {
    return CPException(e.message ?? 'Unknown Firebase Firestore error: ${e.code}');
  }

  factory CPException.dio(DioException e) {
    return CPException(e.message ?? 'Unknown Dio error');
  }
}