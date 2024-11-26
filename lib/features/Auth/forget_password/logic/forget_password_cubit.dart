part of './../../../../core/helpers/export_manager/export_manager.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(const ForgetPasswordStates.initial());

  /// Form key and controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  /// Reset password for the given email
  Future<void> resetPassword({required String email}) async {
    emit(const ForgetPasswordStates.loading());

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .then((v) {
        // Trigger navigation to next screen
        navigatorKey.currentState?.pushReplacementNamed(Routes.signInScreen);
      });

      emit(const ForgetPasswordStates.success());
    } on FirebaseAuthException catch (e) {
      emit(ForgetPasswordStates.failure(
          e.message ?? 'Unknown Firebase error occurred.'));
    } catch (e) {
      emit(const ForgetPasswordStates.failure('An unknown error occurred.'));
    }
  }
}
