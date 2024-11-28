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

  // Change the index of the bottom navigation
  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }

  UserModel? userModel;

  // Fetch user data from Firebase and emit appropriate states
  Future<void> getUserData() async {
    try {
      emit(GetUserDataLoadingState());
      final token =
          await SharedPrefHelper.getSecuredString(prefsKeyIsUserLoggedIn);

      if (token.isEmpty) throw UserNotFoundException('User ID is empty.');

      final userDoc =
          await FirebaseFirestore.instance.collection('users').doc(token).get();

      if (userDoc.exists && userDoc.data() != null) {
        userModel = UserModel.fromJson(userDoc.data()!);
        emit(GetUserDataSuccessState());
      } else {
        throw UserNotFoundException('User not found for ID: $token');
      }
    } catch (e) {
      _handleUserDataError(e);
    }
  }

  // Handle user data errors
  void _handleUserDataError(error) {
    if (error is FirebaseAuthException) {
      emit(GetUserDataErrorState('Authentication error: ${error.message}'));
    } else if (error is FirebaseException) {
      emit(GetUserDataErrorState('Firestore error: ${error.message}'));
    } else {
      emit(GetUserDataErrorState('Error: $error'));
    }
  }

  // Change user password
  void changeUserPassword({required String password}) {
    emit(ChangeUserPasswordLoadingState());

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      _handlePasswordError('No user is currently signed in.');
      return;
    }

    user.updatePassword(password).then((_) {
      emit(ChangeUserPasswordSuccessState());
      getUserData();
    }).catchError((error) {
      _handlePasswordError('Failed to change password: ${error.toString()}');
    });
  }

  // Handle password change errors
  void _handlePasswordError(String errorMessage) {
    debugPrint(errorMessage);
    emit(ChangeUserPasswordErrorState(errorMessage));
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPasswordVisible = true;

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    suffix = isPasswordVisible
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(ShowPasswordState());
  }

  CityModel? cityModel;

  // Fetch data for a specific city by ID
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
      _handleCityDataError(error);
    }
  }

  // Handle errors while fetching city data
  void _handleCityDataError(error) {
    final errorMessage = "Failed to fetch city data: ${error.toString()}";
    debugPrint(errorMessage);
    emit(GetCityDataErrorState(errorMessage));
  }

  PlaceModel? placeModel;

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
        .doc(cId)
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
      await FirebaseFirestore.instance
          .collection('users')
          .doc(prefsKeyIsUserLoggedIn)
          .delete();
      // CacheHelper.removeData(key: 'prefsKeyIsUserLoggedIn');
      // navigateAndFinish(context, routeName: OnBoard.routeName);
    });
  }

  List<CityModel> searchList = [];
  Map<String, dynamic>? search;

  // Search for a city by name
  void searchCity(String searchText) {
    FirebaseFirestore.instance
        .collection('cities')
        .where('name', isEqualTo: searchText)
        .get()
        .then((value) {
      search = value.docs.isNotEmpty ? value.docs[0].data() : null;
    }).catchError((error) {
      debugPrint('Error searching city: $error');
    });
  }

  // Handle profile image selection and cropping
  var picker = ImagePicker();
  File? profileImage;

  Future<void> getProfileImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      profileImage = await cropImage(imageFile: profileImage!);
      emit(GetProfileImagePickedSuccessState());
    } else {
      emit(GetProfileImagePickedErrorState('No image selected'));
    }
  }

  // Crop the selected image
  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    return croppedImage != null ? File(croppedImage.path) : null;
  }

  // Upload the selected profile image
  Future<void> uploadProfileImage({
    required File profileImage,
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    String? address,
  }) async {
    try {
      emit(UploadProfileImageLoadingState());

      if (!_validateProfileImage(profileImage)) return;

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
          address: address);
      emit(UploadProfileImageSuccessState());
    } catch (e) {
      emit(UploadProfileImageErrorState('Error uploading image: $e'));
    }
  }

  // Validate the profile image (file size, type, etc.)
  bool _validateProfileImage(File image) {
    final allowedExtensions = ['jpg', 'jpeg', 'png'];
    final fileExtension = image.path.split('.').last;

    if (!allowedExtensions.contains(fileExtension)) {
      emit(UploadProfileImageErrorState(
          'Invalid file format. Allowed formats: jpg, jpeg, png'));
      return false;
    }

    final fileSize = image.lengthSync();
    if (fileSize > 5 * 1024 * 1024) {
      emit(UploadProfileImageErrorState('File size exceeds the 5MB limit'));
      return false;
    }

    return true;
  }

  // Update user data in Firebase
  void updateUserData({
    required String email,
    required String firstName,
    required String lastName,
    required String phone,
    String? address,
    String? image,
  }) {
    if (!_isValidEmail(email)) {
      emit(UpdateUserErrorState('Invalid email format'));
      return;
    }

    try {
      emit(UpdateUserLoadingState());
      FirebaseFirestore.instance
          .collection('users')
          .doc(prefsKeyIsUserLoggedIn)
          .update({
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
      emit(UpdateUserErrorState('Error: $e'));
    }
  }

  // Validate email format using regular expression
  bool _isValidEmail(String email) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
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
        .doc(prefsKeyIsUserLoggedIn)
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
        .doc(prefsKeyIsUserLoggedIn)
        .collection("yourWishList")
        .where("wishListCityID", isEqualTo: cId)
        .snapshots()
        .listen((event) {
      wishList = [];
      for (var element in event.docs) {
        if (element.data()['prefsKeyIsUserLoggedIn'] == userID) {
          wishList.add(WishListModel.fromFireStore(element.data()));
        }
      }
    });
  }

  deleteWishList(wishListId) {
    FirebaseFirestore.instance
        .collection("wishList")
        .doc(prefsKeyIsUserLoggedIn)
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
        .doc(prefsKeyIsUserLoggedIn)
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
        .doc(prefsKeyIsUserLoggedIn)
        .collection("Day$indexOfMyPlan")
        .where('planCityID', isEqualTo: cId)
        .snapshots()
        .listen((event) {
      allPlan = [];
      for (var element in event.docs) {
        if (element.data()['prefsKeyIsUserLoggedIn'] == userID) {
          allPlan.add(PlanModel.fromFireStore(element.data()));
        }
      }
    });
  }

  deleteMyPlan(myPlanId, int indexOfMyPlan) {
    FirebaseFirestore.instance
        .collection("customizePlan")
        .doc(prefsKeyIsUserLoggedIn)
        .collection("Day$indexOfMyPlan")
        .doc(myPlanId)
        .delete()
        .then((value) {
      emit(DeleteMyPlanSuccessState());
    });
  }

  List<BestPLanModel> bestPlan = [];
  List<String> bestPlanIds = [];

// Fetch all best plans for a given city ID
  void fetchBestPlans(String? cityId) {
    final String defaultCityId = 'Aswan';
    final String selectedCityId = cityId ?? defaultCityId;

    FirebaseFirestore.instance
        .collection('cities')
        .doc(selectedCityId)
        .collection('bestplan')
        .snapshots()
        .listen((snapshot) {
      _updateBestPlans(snapshot);
    }, onError: (error) {
      _handleBestPlanError(error);
    });
  }

// Update the best plans list and IDs from snapshot
  void _updateBestPlans(QuerySnapshot<Map<String, dynamic>> snapshot) {
    bestPlan = snapshot.docs
        .map((doc) => BestPLanModel.fromFireStore(doc.data()))
        .toList();
    bestPlanIds = snapshot.docs.map((doc) => doc.id).toList();
    emit(TripsoStates.updated(bestPlans: bestPlan, bestPlanIds: bestPlanIds));
  }

// Handle errors during fetching best plans
  void _handleBestPlanError(dynamic error) {
    debugPrint("Error fetching best plans: $error");
    emit(GetBestPlanErrorState("Failed to fetch best plans: $error"));
  }

  BestPLanModel? bestPLanModel;

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
}
