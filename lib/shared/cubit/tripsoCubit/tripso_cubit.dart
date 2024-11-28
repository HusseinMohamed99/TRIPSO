part of './../../../core/helpers/export_manager/export_manager.dart';

class TripsoCubit extends Cubit<TripsoStates> {
  TripsoCubit() : super(TripsoInitialState());

  static TripsoCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  final List<Widget> screens = [
    const ExploreScreen(),
    const WishListScreen(),
    const MyPlansScreen(),
    const MyProfileScreen(),
  ];

  final List<String> titles = [
    'Explore',
    'Wishlist',
    'MyPlans',
    'Profile',
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  UserModel? userModel;

  void getUserData() async {
    try {
      emit(GetUserDataLoadingState());
      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uId).get();

      if (userDoc.exists) {
        userModel = UserModel.fromJson(
            userDoc.data()!); // Deserialize JSON into the model
        emit(GetUserDataSuccessState());
      } else {
        throw UserNotFoundException('User not found for ID: $uId');
      }
    } on FirebaseAuthException catch (e) {
      // Firebase Authentication specific error handling
      debugPrint('Auth Error: ${e.message}');
      emit(GetUserDataErrorState('Authentication error: ${e.message}'));
    } on FirebaseException catch (e) {
      // Firebase Firestore specific error handling
      debugPrint('Firestore Error: ${e.message}');
      emit(GetUserDataErrorState('Firestore error: ${e.message}'));
    } catch (e) {
      // Catch any other general exceptions
      debugPrint('General Error: $e');
      emit(GetUserDataErrorState('Error: $e'));
    }
  }

  void changeUserPassword({required String password}) {
    emit(ChangeUserPasswordLoadingState());

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      final errorMessage = 'No user is currently signed in.';
      debugPrint(errorMessage);
      emit(ChangeUserPasswordErrorState(errorMessage));
      return;
    }
    user.updatePassword(password).then((_) {
      emit(ChangeUserPasswordSuccessState());

      // Optionally, refresh user data
      getUserData();
    }).catchError((error) {
      final errorMessage = 'Failed to change password: ${error.toString()}';
      emit(ChangeUserPasswordErrorState(errorMessage));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordVisible = true;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    suffix = isPasswordVisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;

    emit(ShowPasswordState());
  }

  CityModel? cityModel;

  /// Fetches and sets data for a specific city by its ID.
  Future<void> fetchCityData(String? cityId) async {
    if (cityId == null) {
      emit(GetCityDataErrorState("City ID cannot be null."));
      return;
    }

    emit(GetCityDataLoadingState());

    try {
      final cityDoc = await FirebaseFirestore.instance
          .collection('cities')
          .doc(cityId)
          .get();

      if (!cityDoc.exists || cityDoc.data() == null) {
        throw Exception("City with ID '$cityId' not found.");
      }

      cityModel = CityModel.fromFireStore(cityDoc.data()!);
      emit(GetCityDataSuccessState());
    } catch (error) {
      final errorMessage = "Failed to fetch city data: ${error.toString()}";
      debugPrint(errorMessage);
      emit(GetCityDataErrorState(errorMessage));
    }
  }

  // List<CityModel> city = [];
  // List<String> cId = [];

  // // Helper method for fetching city data based on country
  // void getCityDataByCountry(String country) async {
  //   FirebaseFirestore.instance
  //       .collection('cities')
  //       .where("country", isEqualTo: country)
  //       .get()
  //       .then((value) {
  //     city.clear();
  //     cId.clear();
  //     for (var element in value.docs) {
  //       city.add(CityModel.fromFireStore(element.data()));
  //       cId.add(element.id);
  //     }
  //   });
  // }

  // List<CityModel> cityPopular = [];
  // List<String> cIdPopular = [];

  // getPopularData() async {
  //   FirebaseFirestore.instance
  //       .collection('cities')
  //       .where("isPopular", isEqualTo: true)
  //       .get()
  //       .then((value) {
  //     cityPopular = [];
  //     for (var element in value.docs) {
  //       cityPopular.add(CityModel.fromFireStore(element.data()));
  //       cIdPopular.add(element.id);
  //     }
  //   });
  // }

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
      placeModel = PlaceModel.fromJson(value.data()!);
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
      placeModel = PlaceModel.fromJson(value.data()!);
      emit(GetPlaceDataSuccessState());
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
        place.add(PlaceModel.fromJson(element.data()));
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
        popularPlace.add(PlaceModel.fromJson(element.data()));
        popularPlaceId.add(element.id);
      }
    });
  }

  void deleteAccount(context) async {
    await FirebaseAuth.instance.currentUser!.delete().then((value) async {
      await FirebaseFirestore.instance.collection('users').doc(uId).delete();
      // CacheHelper.removeData(key: 'uId');
      // navigateAndFinish(context, routeName: OnBoard.routeName);
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
      emit(GetProfileImagePickedErrorState(
        'No image selected',
      ));
    }
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void uploadProfileImage({
    required File profileImage,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    String? address,
  }) async {
    try {
      emit(UploadProfileImageLoadingState());

      // Validate image (file size, type, etc.)
      final allowedExtensions = ['jpg', 'jpeg', 'png'];
      final fileExtension = profileImage.path.split('.').last;

      if (!allowedExtensions.contains(fileExtension)) {
        emit(UploadProfileImageErrorState(
            'Invalid file format. Allowed formats: jpg, jpeg, png'));
        return;
      }

      final fileSize = await profileImage.length();
      if (fileSize > 5 * 1024 * 1024) {
        // 5MB limit
        emit(UploadProfileImageErrorState('File size exceeds the 5MB limit'));
        return;
      }

      // Proceed with the upload
      final storageRef = firebase_storage.FirebaseStorage.instance.ref().child(
          'userProfileImage/${Uri.file(profileImage.path).pathSegments.last}');

      final uploadTask = storageRef.putFile(profileImage);
      final snapshot = await uploadTask.whenComplete(() {});
      final downloadUrl = await snapshot.ref.getDownloadURL();

      updateUserData(
        email: email,
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        image: downloadUrl,
        address: address ?? '',
      );

      emit(UploadProfileImageSuccessState());
    } catch (e) {
      debugPrint('Error uploading profile image: $e');
      emit(UploadProfileImageErrorState('Error uploading image: $e'));
    }
  }

  bool isValidEmail(String email) {
    // Simple email validation using regular expression
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  void updateUserData({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    String? address,
    String? image,
  }) {
    if (!isValidEmail(email)) {
      emit(UpdateUserErrorState('Invalid email format'));
      return;
    }

    try {
      emit(UpdateUserLoadingState());
      FirebaseFirestore.instance.collection('users').doc(uId).update({
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'phone': phone,
        'image': image ?? userModel?.image,
        'address': address ?? '',
      }).then((_) {
        emit(UpdateUserSuccessState());
      }).catchError((error) {
        emit(UpdateUserErrorState('Error updating user data: $error'));
      });
    } catch (e) {
      debugPrint('Error: $e');
      emit(UpdateUserErrorState('Error: $e'));
    }
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
      uId: userModel?.uId ?? '',
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
      uId: userModel?.uId ?? '',
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

  // void getBestPlan() {
  //   emit(GetBestPlanLoadingState());
  //   FirebaseFirestore.instance
  //       .collection('cities')
  //       .doc('Abu Dhabi')
  //       .collection('bestplan')
  //       .doc('Abu Dhabi Fast Visit')
  //       .get()
  //       .then((value) {
  //     bestPLanModel = BestPLanModel.fromFireStore(value.data()!);
  //     emit(GetBestPlanSuccessState());
  //     if (kDebugMode) {
  //       //  print(value.data());
  //     }
  //   }).catchError((error) {
  //     debugPrint(error.toString());
  //     emit(GetBestPlanErrorState(error.toString()));
  //   });
  // }

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
