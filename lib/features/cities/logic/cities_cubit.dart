part of './../../../core/helpers/export_manager/export_manager.dart';

class CitiesCubit extends Cubit<CitiesStates> {
  CitiesCubit() : super(CitiesInitialState());

  List<CityModel> cities = [];
  List<String> cityIds = [];

  /// Fetches and sets data for all cities in the collection.
  Future<void> fetchAllCities() async {
    emit(CitiesStates.loading());

    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('cities').get();

      if (querySnapshot.docs.isEmpty) {
        debugPrint("No cities found.");
      }

      cities = querySnapshot.docs
          .map((doc) => CityModel.fromFireStore(doc.data()))
          .toList();
      cityIds = querySnapshot.docs.map((doc) => doc.id).toList();
      emit(CitiesStates.success());
    } catch (error) {
      final errorMessage = "Failed to fetch city data: ${error.toString()}";
      debugPrint(errorMessage);
      emit(CitiesStates.error(errorMessage));
    }
  }
}
