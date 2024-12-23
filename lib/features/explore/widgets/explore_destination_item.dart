part of './../../../core/helpers/export_manager/export_manager.dart';

class ExploreDestinationItem extends StatelessWidget {
  const ExploreDestinationItem({
    super.key,
    required this.tripsoCubit,
  });
  final TripsoCubit tripsoCubit;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20).r,
      ),
      elevation: 2,
      margin: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 5.h,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BuildFeatureTitleForDestination(
              onTap: () {
                // Uncomment and implement navigation logic
                context.pushNamed(
                  Routes.historicalCity,
                  arguments: tripsoCubit.cityModel,
                );
              },
              icon: Icons.book_outlined,
              iconColor: const Color.fromARGB(255, 216, 119, 119),
              backgroundColor: const Color.fromRGBO(216, 119, 119, 0.15),
              label: 'Historical',
            ).allPadding(
              hPadding: 10,
            ),
            BuildFeatureTitleForDestination(
              onTap: () {
                context.pushNamed(
                  Routes.customizePlan,
                  arguments: tripsoCubit.cityModel!.cId,
                );
              },
              icon: Icons.dashboard_customize_outlined,
              iconColor: const Color.fromARGB(255, 105, 155, 247),
              backgroundColor: const Color.fromRGBO(105, 155, 247, 0.15),
              label: 'Plans',
            ).allPadding(
              hPadding: 10,
            ),
            BuildFeatureTitleForDestination(
              onTap: () async {
                // Uncomment and implement navigation logic
                // TripsoCubit.get(context).getDataPlaces(cityModel.cId);
                context.pushNamed(
                  Routes.sightsScreen,
                );
              },
              icon: Icons.remove_red_eye_outlined,
              iconColor: const Color.fromARGB(255, 133, 84, 150),
              backgroundColor: const Color.fromRGBO(133, 84, 150, 0.15),
              label: 'Sights',
            ),
          ],
        ),
      ),
    );
  }
}
