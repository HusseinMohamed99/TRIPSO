part of './../../../../core/helpers/export_manager/export_manager.dart';

class SignInCubit extends Cubit<SignInStates> {
  SignInCubit() : super(SignInInitialState());

  /// Form key and controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  /// Password visibility toggling
  bool isPasswordVisible = false;
  IconData passwordIcon = Icons.visibility_outlined;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    passwordIcon = isPasswordVisible
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    emit(TogglePasswordVisibilityState());
  }

  /// User sign-in logic
  Future<void> signInUser({
    required String email,
    required String password,
  }) async {
    if (formKey.currentState?.validate() != true) return;

    emit(SignInLoadingState());
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      final userId = userCredential.user?.uid ?? '';
      if (userId.isEmpty) {
        throw SignInExceptionState("User ID is empty after sign-in.");
      }
      SharedPrefHelper.setSecuredString(
        prefsKeyIsUserLoggedIn,
        userId,
      ); // This seems redundant, consider reviewing.
      emit(SignInSuccessState(userId));
      navigatorKey.currentState
          ?.pushReplacementNamed(Routes.destinationCitiesScreen);
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      emit(SignInErrorState("FirebaseAuthException: ${e.message}"));
    } catch (e) {
      // Handle general errors or custom exceptions
      if (e is SignInExceptionState) {
        emit(SignInErrorState(e.toString()));
      } else {
        emit(SignInErrorState("Unexpected error: $e"));
      }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
