import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignUpStates with _$SignUpStates {
  /// Initial state when no action has been taken
  const factory SignUpStates.initial() = SignUpInitialState;

  /// Loading state while signing up
  const factory SignUpStates.loading() = SignUpLoadingState;

  /// Success state when signup is successful
  const factory SignUpStates.success() = SignUpSuccessState;

  /// Error state when there is a signup failure
  const factory SignUpStates.error(String error) = SignUpErrorState;

  /// Success state for user creation in Firestore
  const factory SignUpStates.userCreateSuccess(String uid) =
      UserCreateSuccessState;

  /// Error state for user creation in Firestore
  const factory SignUpStates.userCreateError(String error) =
      UserCreateErrorState;

  /// State for toggling password visibility
  const factory SignUpStates.changePasswordVisibility() =
      ChangePasswordSignUpState;
}
