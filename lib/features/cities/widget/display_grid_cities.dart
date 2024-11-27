part of './../../../core/helpers/export_manager/export_manager.dart';

class DisplayGridCities extends StatelessWidget {
  const DisplayGridCities({super.key, required this.cubit});

  final CitiesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 2.0.w,
        mainAxisSpacing: 2.h,
        childAspectRatio: 1.h / 1.2.h,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GridCitiesItem(
            cityModel: cubit.cities[index],
          );
        },
        childCount: cubit.cities.length,
      ),
    );
  }
}
