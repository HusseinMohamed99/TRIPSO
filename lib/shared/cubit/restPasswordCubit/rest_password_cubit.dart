import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/shared/cubit/restPasswordCubit/rest_password_state.dart';

import '../../components/show_toast.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordStates> {
  ResetPasswordCubit() : super(ResetPasswordInitialState());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);


  void resetPassword({
    required String email,
  })
  {
    emit(ResetPasswordLoadingState());

    FirebaseAuth.instance.sendPasswordResetEmail(
      email: email,
    ).then((value) {
      emit(ResetPasswordSuccessState());
      showToast(
        state: ToastStates.success,
        text: 'Check Your Mail',
      );
    }).catchError((error) {
      debugPrint(error.toString());
      emit(ResetPasswordErrorState());
      showToast(
        state: ToastStates.error,
        text: 'Reset Password is Failed',
      );
    });
  }


}