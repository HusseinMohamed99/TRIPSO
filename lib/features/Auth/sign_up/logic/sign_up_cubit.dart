part of './../../../../core/helpers/export_manager/export_manager.dart';

// Cubit class
class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  final formKey = GlobalKey<FormState>();
  final navigateKey = GlobalKey<NavigatorState>();
  TextEditingController userFirstNameController = TextEditingController();
  TextEditingController userLastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void userSignUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phone,
  }) async {
    emit(SignUpLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      userCreate(
        phone: phone,
        email: email,
        firstName: firstName,
        lastName: lastName,
        uId: value.user?.uid ?? '',
      );
      // SharedPrefHelper.setSecuredString(
      //   'uId',
      //   value.user!.uid,
      // );
      print('UID: ${value.user!.uid}');
      navigateKey.currentState!.pushNamed(Routes.signInScreen);
      emit(SignUpSuccessState());
    }).catchError((error) {
      // Handle specific FirebaseAuth errors
      // if (error is FirebaseAuthException) {
      //   if (error.code == 'email-already-in-use') {
      //     emit(SignUpErrorState('The email address is already in use.'));
      //   } else if (error.code == 'weak-password') {
      //     emit(SignUpErrorState('The password is too weak.'));
      //   } else if (error.code == 'invalid-email') {
      //     emit(SignUpErrorState('The email address is invalid.'));

      emit(SignUpErrorState(error.toString()));
    });
  }

  // User creation method in Firestore
  void userCreate({
    required String email,
    required String firstName,
    required String lastName,
    required String uId,
    required String phone,
  }) async {
    UserModel model = UserModel(
      email: email,
      firstName: firstName,
      lastName: lastName,
      uId: uId,
      image:
          'https://cdn-icons-png.flaticon.com/512/214/214070.png?w=740&t=st=1676604521~exp=1676605121~hmac=cbd7577a96e66bf8093132e5b5da0c2a649f4f7c7cdfb6019708db0b417ddc8c',
      phone: phone,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(model.toFireStore())
        .then((value) {
      emit(UserCreateSuccessState(uId));
    }).catchError((error) {
      emit(UserCreateErrorState(error.toString()));
    });
  }

  // Password visibility toggle
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void showPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordSignUpState());
  }
}
