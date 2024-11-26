import 'package:freezed_annotation/freezed_annotation.dart';

part 'tripso_state.freezed.dart';

@freezed
class TripsoStates with _$TripsoStates {
  // Initial State
  const factory TripsoStates.initial() = TripsoInitialState;

  // **User Data**
  const factory TripsoStates.getUserDataLoading() = GetUserDataLoadingState;
  const factory TripsoStates.getUserDataSuccess() = GetUserDataSuccessState;
  const factory TripsoStates.getUserDataError(String error) =
      GetUserDataErrorState;

  // **Change User Password**
  const factory TripsoStates.changeUserPasswordLoading() =
      ChangeUserPasswordLoadingState;
  const factory TripsoStates.changeUserPasswordSuccess() =
      ChangeUserPasswordSuccessState;
  const factory TripsoStates.changeUserPasswordError(String error) =
      ChangeUserPasswordErrorState;

  // **Password Visibility**
  const factory TripsoStates.showPassword() = ShowPasswordState;

  // **Bottom Navigation Bar**
  const factory TripsoStates.changeBottomNavBar() = ChangeBottomNavBarState;

  // **City Data**
  const factory TripsoStates.getCityDataLoading() = GetCityDataLoadingState;
  const factory TripsoStates.getCityDataSuccess() = GetCityDataSuccessState;
  const factory TripsoStates.getCityDataError(String error) =
      GetCityDataErrorState;

  // **Place Data**
  const factory TripsoStates.getPlaceDataLoading() = GetPlaceDataLoadingState;
  const factory TripsoStates.getPlaceDataSuccess() = GetPlaceDataSuccessState;
  const factory TripsoStates.getPlaceDataError(String error) =
      GetPlaceDataErrorState;

  // **Best Plan**
  const factory TripsoStates.getBestPlanLoading() = GetBestPlanLoadingState;
  const factory TripsoStates.getBestPlanSuccess() = GetBestPlanSuccessState;
  const factory TripsoStates.getBestPlanError(String error) =
      GetBestPlanErrorState;

  // **Profile Image Picked**
  const factory TripsoStates.getProfileImagePickedLoading() =
      GetProfileImagePickedLoadingState;
  const factory TripsoStates.getProfileImagePickedSuccess() =
      GetProfileImagePickedSuccessState;
  const factory TripsoStates.getProfileImagePickedError(String error) =
      GetProfileImagePickedErrorState;

  // **Cover Image Picked**
  const factory TripsoStates.getCoverImagePickedLoading() =
      GetCoverImagePickedLoadingState;
  const factory TripsoStates.getCoverImagePickedSuccess() =
      GetCoverImagePickedSuccessState;
  const factory TripsoStates.getCoverImagePickedError(String error) =
      GetCoverImagePickedErrorState;

  // **Upload Profile Image**
  const factory TripsoStates.uploadProfileImageLoading() =
      UploadProfileImageLoadingState;
  const factory TripsoStates.uploadProfileImageSuccess() =
      UploadProfileImageSuccessState;
  const factory TripsoStates.uploadProfileImageError(String error) =
      UploadProfileImageErrorState;

  // **Upload Cover Image**
  const factory TripsoStates.uploadCoverImageLoading() =
      UploadCoverImageLoadingState;
  const factory TripsoStates.uploadCoverImageSuccess() =
      UploadCoverImageSuccessState;
  const factory TripsoStates.uploadCoverImageError(String error) =
      UploadCoverImageErrorState;

  // **Update User Data**
  const factory TripsoStates.updateUserLoading() = UpdateUserLoadingState;
  const factory TripsoStates.updateUserSuccess() = UpdateUserSuccessState;
  const factory TripsoStates.updateUserError(String error) =
      UpdateUserErrorState;

  // **Add To Favorite**
  const factory TripsoStates.addToFavoriteLoading() = AddToFavoriteLoadingState;
  const factory TripsoStates.addToFavoriteSuccess() = AddToFavoriteSuccessState;
  const factory TripsoStates.addToFavoriteError(String error) =
      AddToFavoriteErrorState;

  // **UnFavorite**
  const factory TripsoStates.unFavoriteLoading() = UnFavoriteLoadingState;
  const factory TripsoStates.unFavoriteSuccess() = UnFavoriteSuccessState;
  const factory TripsoStates.unFavoriteError(String error) =
      UnFavoriteErrorState;

  // **Places Data**
  const factory TripsoStates.getPlacesLoading() = GetPlacesLoadingState;
  const factory TripsoStates.getPlacesSuccess() = GetPlacesSuccessState;
  const factory TripsoStates.getPlacesError(String error) = GetPlacesErrorState;

  // **Add Plan**
  const factory TripsoStates.addPlanLoading() = AddPlanLoadingState;
  const factory TripsoStates.addPlanSuccess() = AddPlanSuccessState;
  const factory TripsoStates.addPlanError(String error) = AddPlanErrorState;

  // **Delete My Plan**
  const factory TripsoStates.deleteMyPlanLoading() = DeleteMyPlanLoadingState;
  const factory TripsoStates.deleteMyPlanSuccess() = DeleteMyPlanSuccessState;
  const factory TripsoStates.deleteMyPlanError(String error) =
      DeleteMyPlanErrorState;
}
