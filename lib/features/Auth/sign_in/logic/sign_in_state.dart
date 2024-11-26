import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_state.freezed.dart';

@freezed
class SignInStates with _$SignInStates {
  /// Initial state
  const factory SignInStates.initial() = SignInInitialState;

  /// Loading state
  const factory SignInStates.loading() = SignInLoadingState;

  /// Success state with user ID
  const factory SignInStates.success(String uid) = SignInSuccessState;

  /// Error state with a message
  const factory SignInStates.error(String error) = SignInErrorState;

  /// Exception state with a message
  const factory SignInStates.exception(String error) = SignInExceptionState;

  /// State for toggling password visibility
  const factory SignInStates.togglePasswordVisibility() =
      TogglePasswordVisibilityState;
}
