import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripso/mobile/screens/explore/explore.dart';
import 'package:tripso/mobile/screens/on_boarding/on_boarding_screen.dart';
import 'package:tripso/mobile/screens/plans/my_plans.dart';
import 'package:tripso/mobile/screens/profile/my_profile.dart';
import 'package:tripso/mobile/screens/wishlist/wishlist.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/model/plan_model.dart';
import 'package:tripso/model/user_model.dart';
import 'package:tripso/model/wishlist_model.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/show_toast.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/network/cache_helper.dart';
import 'package:tripso/shared/provider/weather_provider.dart';

class TripsoCubit extends Cubit<TripsoStates> {
  TripsoCubit() : super(TripsoInitialState());

  static TripsoCubit get(context) => BlocProvider.of(context);

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
    if (index == 0) {
      getUserData();
      getCityData();
      WeatherProvider();
      getDataPlaces(cityModel!.cId);
      getDataForCity(cityModel!.cId);
      getAllBestPlan(cityModel!.cId);
    }
    if (index == 1) {
      getDataPlaces(cityModel!.cId);
      getDataForCity(cityModel!.cId);
      getAllBestPlan(cityModel!.cId);
      getWishListData(cityModel!.cId, userModel!.uId);
    }
    if (index == 2) {
      getDataPlaces(cityModel!.cId);
      getDataForCity(cityModel!.cId);
      getAllBestPlan(cityModel!.cId);
      getMyAllPlan(cityModel!.cId, userModel!.uId, 1);
    }
    if (index == 3) getUserData();
    emit(ChangeBottomNavBarState());
    currentIndex = index;
  }

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

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void showPassword() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ShowPasswordState());
  }

  CityModel? cityModel;

  void getDataForCity(String? cId) async {
    emit(GetCityDataLoadingState());
    await FirebaseFirestore.instance
        .collection('cities')
        .doc(cId)
        .get()
        .then((value) {
      cityModel = CityModel.fromFireStore(value.data()!);
      emit(GetCityDataSuccessState());
      if (kDebugMode) {
        print(value.data());
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetCityDataErrorState(error.toString()));
    });
  }

  List<CityModel> city = [];
  List<String> cId = [];

  getCityData() async {
    FirebaseFirestore.instance.collection('cities').get().then((value) {
      city = [];
      for (var element in value.docs) {
        city.add(CityModel.fromFireStore(element.data()));
        cId.add(element.id);
        //print("City Model = ${element.data()}");
      }
    });
  }

  List<CityModel> cityEG = [];
  List<String> cIdEG = [];

  getEGData() async {
    FirebaseFirestore.instance
        .collection('cities')
        .where("country", isEqualTo: 'Egypt')
        .get()
        .then((value) {
      cityEG = [];
      for (var element in value.docs) {
        cityEG.add(CityModel.fromFireStore(element.data()));
        cIdEG.add(element.id);
      }
    });
  }

  List<CityModel> cityIT = [];
  List<String> cIdIT = [];

  getITData() async {
    FirebaseFirestore.instance
        .collection('cities')
        .where("country", isEqualTo: "Italy")
        .get()
        .then((value) {
      cityIT = [];
      for (var element in value.docs) {
        cityIT.add(CityModel.fromFireStore(element.data()));
        cIdIT.add(element.id);
      }
    });
  }

  List<CityModel> cityFR = [];
  List<String> cIdFR = [];

  getFRData() async {
    FirebaseFirestore.instance
        .collection('cities')
        .where("country", isEqualTo: "France")
        .get()
        .then((value) {
      cityFR = [];
      for (var element in value.docs) {
        cityFR.add(CityModel.fromFireStore(element.data()));
        cIdFR.add(element.id);
      }
    });
  }

  List<CityModel> cityPopular = [];
  List<String> cIdPopular = [];

  getPopularData() async {
    FirebaseFirestore.instance
        .collection('cities')
        .where("isPopular", isEqualTo: true)
        .get()
        .then((value) {
      cityPopular = [];
      for (var element in value.docs) {
        cityPopular.add(CityModel.fromFireStore(element.data()));
        cIdPopular.add(element.id);
      }
    });
  }

  List<CityModel> cityUAE = [];
  List<String> cIdUAE = [];

  getUAEData() async {
    FirebaseFirestore.instance
        .collection('cities')
        .where("country", isEqualTo: "UAE")
        .get()
        .then((value) {
      cityUAE = [];
      for (var element in value.docs) {
        cityUAE.add(CityModel.fromFireStore(element.data()));
        cIdUAE.add(element.id);
      }
    });
  }

  PlaceModel? placeModel;

  void getDataForPlace() {
    emit(GetPlaceDataLoadingState());
    FirebaseFirestore.instance
        .collection('cities')
        .doc('Abu Dhabi')
        .collection('places')
        .doc('Emirates National Auto Museum')
        .get()
        .then((value) {
      placeModel = PlaceModel.fromFireStore(value.data()!);
      emit(GetPlaceDataSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetPlaceDataErrorState(error.toString()));
    });
  }

  void getDataPlace(String? cId, String? pId) {
    emit(GetPlaceDataLoadingState());
    FirebaseFirestore.instance
        .collection('cities')
        .doc(cId)
        .collection('places')
        .doc(pId)
        .get()
        .then((value) {
      placeModel = PlaceModel.fromFireStore(value.data()!);
      emit(GetPlaceDataSuccessState());
      if (kDebugMode) {
        print(value.data());
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetPlaceDataErrorState(error.toString()));
    });
  }

  List<PlaceModel> place = [];
  List<String> pId = [];

  getDataPlaces(String? cId) {
    FirebaseFirestore.instance
        .collection('cities')
        .doc(cId ?? 'Aswan')
        .collection('places')
        .snapshots()
        .listen((value) async {
      place = [];
      for (var element in value.docs) {
        place.add(PlaceModel.fromFireStore(element.data()));
        pId.add(element.id);
      }
    });
  }

  List<PlaceModel> popularPlace = [];
  List<String> popularPlaceId = [];

  getPopularPlace(String? cId) async {
    FirebaseFirestore.instance
        .collection('cities')
        .doc(cId ?? 'Aswan')
        .collection('places')
        .where('isPopular', isEqualTo: true)
        .get()
        .then((value) {
      popularPlace = [];
      for (var element in value.docs) {
        popularPlace.add(PlaceModel.fromFireStore(element.data()));
        popularPlaceId.add(element.id);
      }
    });
  }

  void deleteAccount(context) async {
    await FirebaseAuth.instance.currentUser!.delete().then((value) async {
      await FirebaseFirestore.instance.collection('users').doc(uId).delete();
      CacheHelper.removeData(key: 'uId');
      navigateAndFinish(context, routeName: OnBoard.routeName);
    });
  }

  List<CityModel> searchList = [];
  Map<String, dynamic>? search;

  searchCity(String searchText) {
    FirebaseFirestore.instance
        .collection('cities')
        .where('name', isEqualTo: searchText)
        .get()
        .then((value) {
      search = value.docs[0].data();
    }).catchError((error) {});
  }

  var picker = ImagePicker();
  File? profileImage;

  Future<void> getProfileImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      profileImage = await cropImage(imageFile: profileImage!);
      emit(GetProfileImagePickedSuccessState());
    } else {
      debugPrint('No image selected');
      emit(GetProfileImagePickedErrorState());
    }
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void uploadProfileImage({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    String? address,
  }) {
    emit(UpdateUserLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'userProfileImage/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        updateUserData(
          email: email,
          phone: phone,
          firstName: firstName,
          lastName: lastName,
          image: value,
          address: address ?? '',
        );
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }

  void updateUserData({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    String? image,
    String? address,
  }) {
    emit(UpdateUserLoadingState());
    UserModel model = UserModel(
      email: email,
      phone: phone,
      image: image ?? userModel!.image,
      uId: userModel!.uId,
      firstName: firstName,
      lastName: lastName,
      address: address ?? '',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(model.toFireStore())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(UpdateUserErrorState());
    });
  }

  void addWishList({
    required String wishListCityID,
    required String wishListName,
    required String wishListImage,
    required String wishListHistory,
    required String wishListLocation,
    required List<String> wishListTimeOfDay,
    required String wishListTickets,
    required String wishListId,
    required String wishListAddress,
    required String wishListRate,
    required bool wishListIsPopular,
  }) {
    WishListModel model = WishListModel(
      wishListCityID: wishListCityID,
      wishListName: wishListName,
      wishListHistory: wishListHistory,
      wishListTimeOfDay: wishListTimeOfDay,
      wishListImage: wishListImage,
      wishListLocation: wishListLocation,
      wishListTickets: wishListTickets,
      wishListId: wishListId,
      wishListIsPopular: wishListIsPopular,
      wishListAddress: wishListAddress,
      wishListRate: wishListRate,
      uId: userModel!.uId,
    );
    FirebaseFirestore.instance
        .collection('wishList')
        .doc(uId)
        .collection('yourWishList')
        .doc(wishListId)
        .set(model.toFireStore())
        .then((value) {
      emit(AddToFavoriteSuccessState());
    }).catchError((error) {
      emit(AddToFavoriteErrorState(error.toString()));
    });
  }

  List<WishListModel> wishList = [];
  WishListModel? wishListModel;

  void getWishListData(
    String? cId,
    String? userID,
  ) async {
    FirebaseFirestore.instance
        .collection("wishList")
        .doc(uId)
        .collection("yourWishList")
        .where("wishListCityID", isEqualTo: cId)
        .snapshots()
        .listen((event) {
      wishList = [];
      for (var element in event.docs) {
        if (element.data()['uId'] == userID) {
          wishList.add(WishListModel.fromFireStore(element.data()));
        }
      }
    });
  }

  deleteWishList(wishListId) {
    FirebaseFirestore.instance
        .collection("wishList")
        .doc(uId)
        .collection("yourWishList")
        .doc(wishListId)
        .delete()
        .then((value) {
      emit(UnFavoriteSuccessState());
    });
  }

  void addMyPlan({
    required int index,
    required String planCityID,
    required String planName,
    required String planImage,
    required String planHistory,
    required String planLocation,
    required List<String> planTimeOfDay,
    required String planTickets,
    required String planId,
    required String planAddress,
    required String planRate,
    required bool planIsPopular,
    required int indexOfDay,
    required DateTime dateTime,
  }) {
    PlanModel planModel = PlanModel(
      planName: planName,
      planHistory: planHistory,
      planTimeOfDay: planTimeOfDay,
      planImage: planImage,
      planLocation: planLocation,
      planTickets: planTickets,
      planId: planId,
      planIsPopular: planIsPopular,
      planAddress: planAddress,
      planRate: planRate,
      planCityID: planCityID,
      uId: userModel!.uId,
      indexOfDays: indexOfDay,
      dateTime: dateTime,
    );
    FirebaseFirestore.instance
        .collection("customizePlan")
        .doc(uId)
        .collection('Day$index')
        .doc(planId)
        .set(planModel.toFireStore())
        .then((value) {
      emit(AddPlanSuccessState());
    }).catchError((error) {
      emit(AddPlanErrorState(error));
    });
  }

  List<PlanModel> allPlan = [];
  PlanModel? allPlanModel;

  void getMyAllPlan(
    String? cId,
    String? userID,
    int indexOfMyPlan,
  ) async {
    FirebaseFirestore.instance
        .collection("customizePlan")
        .doc(uId)
        .collection("Day$indexOfMyPlan")
        .where('planCityID', isEqualTo: cId)
        .snapshots()
        .listen((event) {
      allPlan = [];
      for (var element in event.docs) {
        if (element.data()['uId'] == userID) {
          allPlan.add(PlanModel.fromFireStore(element.data()));
        }
      }
    });
  }

  deleteMyPlan(myPlanId, int indexOfMyPlan) {
    FirebaseFirestore.instance
        .collection("customizePlan")
        .doc(uId)
        .collection("Day$indexOfMyPlan")
        .doc(myPlanId)
        .delete()
        .then((value) {
      emit(DeleteMyPlanSuccessState());
    });
  }

  List<BestPLanModel> bestPlan = [];
  List<String> bestPlanId = [];

  getAllBestPlan(String? cId) {
    FirebaseFirestore.instance
        .collection('cities')
        .doc(cId ?? 'Aswan')
        .collection('bestplan')
        .snapshots()
        .listen((value) async {
      bestPlan = [];
      for (var element in value.docs) {
        bestPlan.add(BestPLanModel.fromFireStore(element.data()));
        bestPlanId.add(element.id);
      }
    });
  }

  BestPLanModel? bestPLanModel;

  void getBestPlan() {
    emit(GetBestPlanLoadingState());
    FirebaseFirestore.instance
        .collection('cities')
        .doc('Abu Dhabi')
        .collection('bestplan')
        .doc('Abu Dhabi Fast Visit')
        .get()
        .then((value) {
      bestPLanModel = BestPLanModel.fromFireStore(value.data()!);
      emit(GetBestPlanSuccessState());
      if (kDebugMode) {
        //  print(value.data());
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetBestPlanErrorState(error.toString()));
    });
  }

  Best? best;

  void getDataPlaceForBestPlan(String cId, String pId) {
    emit(GetPlaceDataLoadingState());
    FirebaseFirestore.instance
        .collection('cities')
        .doc(cId)
        .collection('places')
        .doc(pId)
        .get()
        .then((value) {
      best = Best.fromFireStore(value.data()!);
      emit(GetPlaceDataSuccessState());
      if (kDebugMode) {
        print(value.data());
      }
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetPlaceDataErrorState(error.toString()));
    });
  }

// void getMyPlan(
//   String? cId,
//   int indexOfMyPlan,
// ) async {
//   FirebaseFirestore.instance
//       .collection("cities")
//       .doc(cId)
//       .collection('bestplan')
//       .doc('Abu Dhabi Best Plan')
//       .collection('Day$indexOfMyPlan')
//       .where('planCityID', isEqualTo: cId)
//       .snapshots()
//       .listen((event) {
//     allPlan = [];
//     for (var element in event.docs) {
//       allPlan.add(PlanModel.fromFireStore(element.data()));
//       print(element.data());
//     }
//   });
// }
}
