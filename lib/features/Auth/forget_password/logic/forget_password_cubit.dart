import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/features/Auth/forget_password/logic/forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(InitialForgetPasswordState());

  void resetPassword({
    required String email,
  }) {
    emit(ForgetPasswordLoadingState());

    FirebaseAuth.instance
        .sendPasswordResetEmail(
      email: email,
    )
        .then((value) {
      emit(ForgetPasswordSuccessfulState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ForgotPasswordFailureState());
    });
  }
}
