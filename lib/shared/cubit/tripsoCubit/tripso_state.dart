abstract class TripsoStates {}

class TripsoInitialState extends TripsoStates {}

class GetUserDataLoadingState extends TripsoStates {}

class GetUserDataSuccessState extends TripsoStates {}

class GetUserDataErrorState extends TripsoStates {
  final String error;

  GetUserDataErrorState(this.error);
}

class ChangeUserPasswordLoadingState extends TripsoStates {}

class ChangeUserPasswordSuccessState extends TripsoStates {}

class ChangeUserPasswordErrorState extends TripsoStates {
  final String error;

  ChangeUserPasswordErrorState(this.error);
}

class ShowPasswordState extends TripsoStates {}

class ChangeBottomNavBarState extends TripsoStates {}

class GetCityDataLoadingState extends TripsoStates {}

class GetCityDataSuccessState extends TripsoStates {}

class GetCityDataErrorState extends TripsoStates {
  final String error;

  GetCityDataErrorState(this.error);
}

class GetPlaceDataLoadingState extends TripsoStates {}

class GetPlaceDataSuccessState extends TripsoStates {}

class GetPlaceDataErrorState extends TripsoStates {
  final String error;

  GetPlaceDataErrorState(this.error);
}

class GetBestPlanLoadingState extends TripsoStates {}

class GetBestPlanSuccessState extends TripsoStates {}

class GetBestPlanErrorState extends TripsoStates {
  final String error;

  GetBestPlanErrorState(this.error);
}

class GetProfileImagePickedSuccessState extends TripsoStates {}

class GetProfileImagePickedErrorState extends TripsoStates {}

class GetCoverImagePickedSuccessState extends TripsoStates {}

class GetCoverImagePickedErrorState extends TripsoStates {}

class UploadProfileImageSuccessState extends TripsoStates {}

class UploadProfileImageErrorState extends TripsoStates {}

class UploadCoverImageSuccessState extends TripsoStates {}

class UploadCoverImageErrorState extends TripsoStates {}

class UpdateUserLoadingState extends TripsoStates {}

class UpdateUserSuccessState extends TripsoStates {}

class UpdateUserErrorState extends TripsoStates {}

class AddToFavoriteSuccessState extends TripsoStates {}

class AddToFavoriteErrorState extends TripsoStates {
  final String error;

  AddToFavoriteErrorState(this.error);
}

class UnFavoriteSuccessState extends TripsoStates {}

class UnFavoriteErrorState extends TripsoStates {
  final String error;

  UnFavoriteErrorState(this.error);
}

class GetPlacesSuccessState extends TripsoStates {}

class GetPlacesErrorState extends TripsoStates {
  final String error;

  GetPlacesErrorState(this.error);
}

class AddPlanSuccessState extends TripsoStates {}

class AddPlanErrorState extends TripsoStates {
  final String error;

  AddPlanErrorState(this.error);
}

class DeleteMyPlanSuccessState extends TripsoStates {}
