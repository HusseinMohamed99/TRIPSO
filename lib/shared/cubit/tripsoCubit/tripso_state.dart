import 'package:freezed_annotation/freezed_annotation.dart';

part 'tripso_state.freezed.dart';

@freezed
class TripsoStates with _$TripsoStates {
  const factory TripsoStates.initial() = TripsoInitialState;

  const factory TripsoStates.getUserDataLoading() = GetUserDataLoadingState;
  const factory TripsoStates.getUserDataSuccess() = GetUserDataSuccessState;
  const factory TripsoStates.getUserDataError(String error) =
      GetUserDataErrorState;

  const factory TripsoStates.changeUserPasswordLoading() =
      ChangeUserPasswordLoadingState;
  const factory TripsoStates.changeUserPasswordSuccess() =
      ChangeUserPasswordSuccessState;
  const factory TripsoStates.changeUserPasswordError(String error) =
      ChangeUserPasswordErrorState;

  const factory TripsoStates.showPassword() = ShowPasswordState;
  const factory TripsoStates.changeBottomNavBar() = ChangeBottomNavBarState;

  const factory TripsoStates.getCityDataLoading() = GetCityDataLoadingState;
  const factory TripsoStates.getCityDataSuccess() = GetCityDataSuccessState;
  const factory TripsoStates.getCityDataError(String error) =
      GetCityDataErrorState;

  const factory TripsoStates.getPlaceDataLoading() = GetPlaceDataLoadingState;
  const factory TripsoStates.getPlaceDataSuccess() = GetPlaceDataSuccessState;
  const factory TripsoStates.getPlaceDataError(String error) =
      GetPlaceDataErrorState;

  const factory TripsoStates.getBestPlanLoading() = GetBestPlanLoadingState;
  const factory TripsoStates.getBestPlanSuccess() = GetBestPlanSuccessState;
  const factory TripsoStates.getBestPlanError(String error) =
      GetBestPlanErrorState;

  const factory TripsoStates.getProfileImagePickedSuccess() =
      GetProfileImagePickedSuccessState;
  const factory TripsoStates.getProfileImagePickedError(String error) =
      GetProfileImagePickedErrorState;

  const factory TripsoStates.getCoverImagePickedSuccess() =
      GetCoverImagePickedSuccessState;
  const factory TripsoStates.getCoverImagePickedError(String error) =
      GetCoverImagePickedErrorState;

  const factory TripsoStates.uploadProfileImageSuccess() =
      UploadProfileImageSuccessState;
  const factory TripsoStates.uploadProfileImageLoading() =
      UploadProfileImageLoadingState;
  const factory TripsoStates.uploadProfileImageError(String error) =
      UploadProfileImageErrorState;

  const factory TripsoStates.uploadCoverImageSuccess() =
      UploadCoverImageSuccessState;
  const factory TripsoStates.uploadCoverImageError(String error) =
      UploadCoverImageErrorState;

  const factory TripsoStates.updateUserLoading() = UpdateUserLoadingState;
  const factory TripsoStates.updateUserSuccess() = UpdateUserSuccessState;
  const factory TripsoStates.updateUserError(String error) =
      UpdateUserErrorState;

  const factory TripsoStates.addToFavoriteSuccess() = AddToFavoriteSuccessState;
  const factory TripsoStates.addToFavoriteError(String error) =
      AddToFavoriteErrorState;

  const factory TripsoStates.unFavoriteSuccess() = UnFavoriteSuccessState;
  const factory TripsoStates.unFavoriteError(String error) =
      UnFavoriteErrorState;

  const factory TripsoStates.getPlacesSuccess() = GetPlacesSuccessState;
  const factory TripsoStates.getPlacesError(String error) = GetPlacesErrorState;

  const factory TripsoStates.addPlanSuccess() = AddPlanSuccessState;
  const factory TripsoStates.addPlanError(String error) = AddPlanErrorState;

  const factory TripsoStates.deleteMyPlanSuccess() = DeleteMyPlanSuccessState;
}
