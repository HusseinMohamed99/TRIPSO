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
      margin: const EdgeInsets.all(10).r,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.all(10).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFeatureTile(
              context: context,
              onTap: () {
                // Uncomment and implement navigation logic
                // navigateTo(context, routeName: HistoricalCity.routeName, arguments: CityModel(...));
              },
              icon: Icons.book_outlined,
              iconColor: const Color.fromARGB(255, 216, 119, 119),
              backgroundColor: const Color.fromRGBO(216, 119, 119, 0.15),
              label: 'Historical',
            ),
            Space(height: 0, width: 10),
            _buildFeatureTile(
              context: context,
              onTap: () {
                navigateTo(context, routeName: CreateCustomizePlan.routeName);
              },
              icon: Icons.dashboard_customize_outlined,
              iconColor: const Color.fromARGB(255, 105, 155, 247),
              backgroundColor: const Color.fromRGBO(105, 155, 247, 0.15),
              label: 'Plans',
            ),
            Space(height: 0, width: 10),
            _buildFeatureTile(
              context: context,
              onTap: () async {
                // Uncomment and implement navigation logic
                // TripsoCubit.get(context).getDataPlaces(cityModel.cId);
                // navigateTo(context, routeName: SightsScreen.routeName, arguments: ScreenArgs(...));
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

  /// Builds an individual feature tile with an icon, background, and label.
  Widget _buildFeatureTile({
    required BuildContext context,
    required VoidCallback onTap,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String label,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    backgroundColor.withOpacity(0.8),
                    backgroundColor.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor.withOpacity(0.3),
                    offset: Offset(0, 4),
                    blurRadius: 10.r,
                  ),
                ],
                borderRadius: BorderRadius.circular(20).r,
              ),
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                  size: 32.sp,
                  color: iconColor,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: context.titleSmall?.copyWith(
                fontWeight: FontWeightHelper.semiBold,
                color: ColorsManager.blackPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
