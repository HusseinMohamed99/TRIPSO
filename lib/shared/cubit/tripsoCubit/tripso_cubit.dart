import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/model/user_model.dart';
import 'package:tripso/shared/components/show_toast.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class TripsoCubit extends Cubit<TripsoStates> {
  TripsoCubit() : super(TripsoInitialState());

  static TripsoCubit get(context) => BlocProvider.of(context);

  // ----------------------------------------------------------//
  ///START : GetUserData

  void getUserData() {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .withConverter<UserModel>(
            fromFirestore: ((snapshot, _) =>
                UserModel.fromFireStore(snapshot.data()!)),
            toFirestore: (users, _) => users.toFireStore())
        .doc(uId)
        .get()
        .then((value) {
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUserDataErrorState(error.toString()));
    });
  }

  // ----------------------------------------------------------//
  ///START : ChangeUserPassword
  void changeUserPassword({
    required String password,
  }) {
    emit(ChangeUserPasswordLoadingState());
    FirebaseAuth.instance.currentUser?.updatePassword(password).then((value) {
      showToast(
        state: ToastStates.success,
        text: 'Change Successful',
      );
      emit(ChangeUserPasswordSuccessState());
      getUserData();
    }).catchError((error) {
      showToast(
        state: ToastStates.error,
        text: 'process failed\nYou Should Re-login Before Change Password',
      );
      emit(ChangeUserPasswordErrorState(error.toString()));
      debugPrint(error.toString());
    });
  }

  ///END : ChangeUserPassword

// ----------------------------------------------------------//
  ///START : Show Password
  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void showPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShowPasswordState());
  }

  ///END : Show Password

//------------------------------------------------------------//
}
