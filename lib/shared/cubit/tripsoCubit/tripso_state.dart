abstract class TripsoStates {}
class TripsoInitialState extends TripsoStates {}

// ----------------------------------------------------------//
///START : GetUserData
class GetUserDataLoadingState extends TripsoStates {}
class GetUserDataSuccessState extends TripsoStates {}
class GetUserDataErrorState extends TripsoStates {
  final String error ;
  GetUserDataErrorState (this.error);
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

/// START : ShowPassword
class ShowPasswordState extends TripsoStates {}

///END : ShowPassword

/// START : ChangeUserPassword
class ChangeBottomNavBarState extends TripsoStates {}

/// END : ChangeUserPassword
