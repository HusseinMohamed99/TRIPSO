part of '../../../core/helpers/export_manager/export_manager.dart';

class DestinationCitiesScreen extends StatelessWidget {
  const DestinationCitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tripsoCubit = context.read<TripsoCubit>();

    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUI(),
          child: Scaffold(
            body: _buildBody(state, tripsoCubit),
          ),
        );
      },
    );
  }

  // Function to return the correct widget based on the current state
  Widget _buildBody(TripsoStates state, TripsoCubit tripsoCubit) {
    if (state is GetCityDataLoadingState) {
      // Show skeleton loader when data is being loaded
      return DestinationCitiesWidget(tripsoCubit: tripsoCubit).skeletonize();
    } else if (state is GetCityDataSuccessState) {
      // Handle success state and show data
      return DestinationCitiesWidget(tripsoCubit: tripsoCubit);
    } else if (state is GetCityDataErrorState) {
      // Optionally, show an error message when there is an error
      return Center(child: Text('Failed to load cities.'));
    } else {
      // Default or initial state
      return Center(child: Text('Welcome to the Cities Screen.'));
    }
  }
}
