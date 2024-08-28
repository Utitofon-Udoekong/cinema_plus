part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required AppUser currentUser,
    required bool isLoading,
    required String success,
    required String failure
  }) = _ProfileState;

  factory ProfileState.initial() => ProfileState(
        currentUser: AppUser.empty(),
        isLoading: false,
        success: '',
        failure: ''
      );
}
