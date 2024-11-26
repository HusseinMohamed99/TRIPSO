part of '../../../../core/helpers/export_manager/export_manager.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  /// Form key and controllers
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userFirstNameController = TextEditingController();
  final TextEditingController userLastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  /// Sign up a new user
  Future<void> userSignUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    emit(SignUpLoadingState());
    try {
      // Create a new user in Firebase Authentication
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Save user data in Firestore
      await _userCreate(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        uId: userCredential.user!.uid,
      );

      // Save user ID in secure storage
      await SharedPrefHelper.setSecuredString('uId', userCredential.user!.uid);

      emit(SignUpSuccessState());
      // Trigger navigation to next screen
      navigatorKey.currentState?.pushReplacementNamed(Routes.signInScreen);
    } on FirebaseAuthException catch (e) {
      emit(SignUpErrorState(
          e.message ?? 'An unknown FirebaseAuth error occurred.'));
    } catch (e) {
      emit(SignUpErrorState('SignUp Error: $e'));
    }
  }

  /// Save user details in Firestore
  Future<void> _userCreate({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    required String uId,
  }) async {
    final model = UserModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      uId: uId,
      image:
          'https://cdn-icons-png.flaticon.com/512/214/214070.png?w=740&t=st=1676604521~exp=1676605121~hmac=cbd7577a96e66bf8093132e5b5da0c2a649f4f7c7cdfb6019708db0b417ddc8c',
    );

    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(uId)
          .set(model.toJson());

      emit(UserCreateSuccessState(uId));
    } catch (e) {
      emit(UserCreateErrorState('Firestore Error: $e'));
    }
  }

  /// Toggle password visibility
  bool isPasswordVisible = false;
  IconData passwordIcon = Icons.visibility_outlined;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    passwordIcon = isPasswordVisible
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;

    emit(ChangePasswordSignUpState());
  }

  /// Clean up resources
  @override
  Future<void> close() {
    userFirstNameController.dispose();
    userLastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    return super.close();
  }
}
