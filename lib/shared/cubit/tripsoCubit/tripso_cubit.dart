import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripso/mobile/screens/explore/explore.dart';
import 'package:tripso/mobile/screens/on_boarding/on_boarding_screen.dart';
import 'package:tripso/mobile/screens/plans/my_plans.dart';
import 'package:tripso/mobile/screens/profile/my_profile.dart';
import 'package:tripso/model/country_model.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/network/cache_helper.dart';
import 'package:tripso/shared/provider/weather_provider.dart';
import 'package:tripso/mobile/screens/wishlist/wishlist.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/user_model.dart';
import 'package:tripso/shared/components/show_toast.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import '../../../model/place_model.dart';
import 'package:image_cropper/image_cropper.dart';

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
    if (index == 0) {
      getUserData();
      getCityData();
      WeatherProvider();
      getDataPlaces(cityModel!.cId);
      getDataForCity(cityModel!.cId);
    }
    if (index == 1) {}
    if (index == 2) {}
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

  ///END : City Data
  List<CityModel> city = [];
  List<String> cId = [];

  getCityData() async {
    FirebaseFirestore.instance.collection('cities').get().then((value) {
      city = [];
      for (var element in value.docs) {
        city.add(CityModel.fromFireStore(element.data()));
        cId.add(element.id);
        print(element.data());
        print('====================================');
      }
    });
  }

  CountryModel? countryModel;
  List<CountryModel> country = [];
  List<String> counId = [];

  getCountryData() async {
    FirebaseFirestore.instance.collection('country').get().then((value) {
      country = [];
      for (var element in value.docs) {
        country.add(CountryModel.fromFireStore(element.data()));
        counId.add(element.id);
        // print(element.data());
        //  print('====================================');
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
        // print(element.data());
        //  print('====================================');
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
        // print(element.data());
        //  print('====================================');
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
        // print(element.data());
        //  print('====================================');
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
        // print(element.data());
        //  print('====================================');
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
        // print(element.data());
        //  print('====================================');
      }
    });
  }

  ///START : GetPlaceData
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
      if (kDebugMode) {
        print(value.data());
      }
      // print('value.id ======== ${value.id}');
      // print(
      //     '==============================================================================');
    }).catchError((error) {
      debugPrint(error.toString());
      emit(GetPlaceDataErrorState(error.toString()));
    });
  }

  ///END : Place Data
  List<PlaceModel> place = [];
  List<String> pId = [];

  getDataPlaces(String? cId) async {
    FirebaseFirestore.instance
        .collection('cities')
        .doc(cId ?? 'Aswan')
        .collection('places')
        .get()
        .then((value) {
      place = [];
      for (var element in value.docs) {
        place.add(PlaceModel.fromFireStore(element.data()));
        pId.add(element.id);
        if (kDebugMode) {
          print(element.data());
        }
        debugPrint('================================================');
      }
    });
  }

  ///END : popularPlace Data
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
        if (kDebugMode) {
          print(element.data());
        }
        debugPrint('================================================');
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

  ///START : GetProfileImage
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

  ///END : GetProfileImage
  // ----------------------------------------------------------//

  ///START : UploadProfileImage
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

  ///END : UploadProfileImage

  ///START : UpdateUserData
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

  ///END : UpdateUserData
}