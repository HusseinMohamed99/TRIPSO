import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/mobile/screens/explore/explore.dart';
import 'package:tripso/mobile/screens/my_plan/my_plans.dart';
import 'package:tripso/mobile/screens/profile/my_profile.dart';
import 'package:tripso/mobile/screens/wishlist/wishlist.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/user_model.dart';
import 'package:tripso/shared/components/show_toast.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class TripsoCubit extends Cubit<TripsoStates> {
  TripsoCubit() : super(TripsoInitialState());

  static TripsoCubit get(context) => BlocProvider.of(context);

  ///START : ChangeBottomNavBar
  int currentIndex = 0;
  List<Widget> screens = [
    const ExploreScreen(),
    const WishListScreen(),
    const MyPlansScreen(),
    const MyProfileScreen(),
  ];
  List<String> titles = [
    'Explore',
    'Wishlist',
    'My Plans',
    'Profile',
  ];
  void changeIndex(int index) {
    currentIndex = index;
    if (index == 0) getCityData();
    if (index == 1) getUserData();
    if (index == 2) getUserData();
    if (index == 3) getUserData();
    emit(ChangeBottomNavBarState());
  }

  ///END : ChangeBottomNavBar

  ///START : GetUserData
  UserModel? userModel;
  void getUserData() {
    emit(GetUserDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = UserModel.fromFireStore(value.data()!);
      emit(GetUserDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetUserDataErrorState(error.toString()));
    });
  }

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

  ///START : GetCityData
  CityModel? cityModel;
  void getData() {
    emit(GetCityDataLoadingState());
    FirebaseFirestore.instance
        .collection('cities')
        .doc('Aswan')
        .get()
        .then((value) {
      cityModel = CityModel.fromFireStore(value.data()!);
      emit(GetCityDataSuccessState());
      //print(value.data());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetCityDataErrorState(error.toString()));
    });
  }

  ///END : City Data
  List<CityModel> city = [];
  List<String> cId = [];

  getCityData() async {
    FirebaseFirestore.instance.collection('cities').get().then((value) {
      value.docs.forEach((element) {
        city.add(CityModel.fromFireStore(element.data()));
        cId.add(element.id);
        // print(element.data());
        //  print('====================================');
      });
    });
  }
}