part of '../../../core/helpers/export_manager/export_manager.dart';

class DestinationCitiesScreen extends StatelessWidget {
  const DestinationCitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final citiesCubit = context.read<CitiesCubit>();

    return BlocConsumer<CitiesCubit, CitiesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: systemUI(),
          child: Scaffold(
            body: _buildBody(state, citiesCubit),
          ),
        );
      },
    );
  }

  // Function to return the correct widget based on the current state
  Widget _buildBody(CitiesStates state, CitiesCubit citiesCubit) {
    if (state is CitiesLoadingState) {
      // Show skeleton loader when data is being loaded
      return DestinationCitiesWidget(citiesCubit: citiesCubit).skeletonize();
    } else if (state is CitiesSuccessState) {
      // Handle success state and show data
      return DestinationCitiesWidget(citiesCubit: citiesCubit);
    } else if (state is CitiesErrorState) {
      // Optionally, show an error message when there is an error
      return Center(child: Text('Failed to load cities.'));
    } else {
      // Default or initial state
      return Center(child: Text('Welcome to the Cities Screen.'));
    }
  }
}
