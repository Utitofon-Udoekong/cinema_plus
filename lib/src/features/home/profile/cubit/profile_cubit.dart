import 'package:cinema_plus/src/domain/exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinema_plus/src/domain/repository/auth_repository.dart';
import 'package:cinema_plus/src/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

@lazySingleton
class ProfileCubit extends Cubit<ProfileState> {
  final AuthenticationRepository _authenticationRepository;
  ProfileCubit(this._authenticationRepository) : super(ProfileState.initial());

  AppUser get currentUser => _authenticationRepository.currentUser;

  void logout() async {
    load();
    try {
      final isLoggedOut = await _authenticationRepository.logOut();
      if (isLoggedOut) {
        pass('Logged out');
      }
    } on CPException catch (e) {
      fail(e.message);
    }
  }

  void load() => emit(
        state.copyWith(
          isLoading: true,
          failure: '',
          success: '',
        ),
      );
  void pass(String message) =>
      emit(state.copyWith(isLoading: false, success: message));
  void fail(String message) =>
      emit(state.copyWith(isLoading: false, failure: message));
}
