import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordStates with _$ForgetPasswordStates {
  /// Initial state before any action is taken
  const factory ForgetPasswordStates.initial() = InitialForgetPasswordState;

  /// State while the password reset request is in progress
  const factory ForgetPasswordStates.loading() = ForgetPasswordLoadingState;

  /// State when the password reset email is successfully sent
  const factory ForgetPasswordStates.success() = ForgetPasswordSuccessfulState;

  /// State when the password reset request fails
  const factory ForgetPasswordStates.failure(String error) =
      ForgetPasswordFailureState;
}
