abstract class TripsoStates {}

class TripsoInitialState extends TripsoStates {}

// ----------------------------------------------------------//
///START : GetUserData
class GetUserDataLoadingState extends TripsoStates {}

class GetUserDataSuccessState extends TripsoStates {}

class GetUserDataErrorState extends TripsoStates {
  final String error;

  GetUserDataErrorState(this.error);
}

///END : GetUserData
//------------------------------------------------------------//

///START : ChangeUserPassword
class ChangeUserPasswordLoadingState extends TripsoStates {}

class ChangeUserPasswordSuccessState extends TripsoStates {}

class ChangeUserPasswordErrorState extends TripsoStates {
  final String error;

  ChangeUserPasswordErrorState(this.error);
}

///END : ChangeUserPassword

//------------------------------------------------------------//

/// START : ShowPassword
class ShowPasswordState extends TripsoStates {}

///END : ShowPassword

//------------------------------------------------------------//

/// START : ChangeUserPassword
class ChangeBottomNavBarState extends TripsoStates {}

/// END : ChangeUserPassword

//------------------------------------------------------------//

///START : GetCityData

class GetCityDataLoadingState extends TripsoStates {}

class GetCityDataSuccessState extends TripsoStates {}

class GetCityDataErrorState extends TripsoStates {
  final String error;

  GetCityDataErrorState(this.error);
}

///END : GetCityData

//------------------------------------------------------------//

//START : GetPlaceData

class GetPlaceDataLoadingState extends TripsoStates {}

class GetPlaceDataSuccessState extends TripsoStates {}

class GetPlaceDataErrorState extends TripsoStates {
  final String error;

  GetPlaceDataErrorState(this.error);
}

///END : GetPlaceData

//------------------------------------------------------------//
///START : GetProfileImage
class GetProfileImagePickedSuccessState extends TripsoStates {}

class GetProfileImagePickedErrorState extends TripsoStates {}

///END : GetProfileImage
// ----------------------------------------------------------//
///START : GetCoverImage
class GetCoverImagePickedSuccessState extends TripsoStates {}

class GetCoverImagePickedErrorState extends TripsoStates {}

///END : GetCoverImage
// ----------------------------------------------------------//
///START : UploadProfileImage
class UploadProfileImageSuccessState extends TripsoStates {}

class UploadProfileImageErrorState extends TripsoStates {}

///END : UploadProfileImage
// ----------------------------------------------------------//
///START : UploadCoverImage
class UploadCoverImageSuccessState extends TripsoStates {}

class UploadCoverImageErrorState extends TripsoStates {}

///END : UploadCoverImage
// ----------------------------------------------------------//
///START : UpdateUserData
class UpdateUserLoadingState extends TripsoStates {}

class UpdateUserErrorState extends TripsoStates {}

///END : UpdateUserData
class AddtoFavoriteLoadingState extends TripsoStates {}

class AddtoFavoriteSuccessState extends TripsoStates {}

class GetLikedUsersSuccessState extends TripsoStates {}

class AddtoFavoriteErrorState extends TripsoStates {
  final String error;

  AddtoFavoriteErrorState(this.error);
}

class disFavoriteSuccessState extends TripsoStates {}

class disFavoriteErrorState extends TripsoStates {
  final String error;

  disFavoriteErrorState(this.error);
}

class GetPlacesSuccessState extends TripsoStates {}

class GetPlacesErrorState extends TripsoStates {
  final String error;

  GetPlacesErrorState(this.error);
}