part of './../../../core/helpers/export_manager/export_manager.dart';

class TopPlansWidget extends StatelessWidget {
  const TopPlansWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TripsoCubit>();
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            _buildTitleSection(context),
            Space(height: 16, width: 0), // Space between title and carousel
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TopPlanItem(
                    // cityModel: cubit.cityModel!,
                    // placeModel: cubit.placeModel!,
                    bestPLanModel: cubit.bestPlan[index],
                  );
                },
                itemCount: cubit.bestPlan.length,
              ),
            ),
          ],
        );
      },
    );
  }

  // Title and See More Button Section
  Widget _buildTitleSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Top Plans',
            style: context.titleMedium?.copyWith(
              fontWeight:
                  FontWeightHelper.semiBold, // Slightly heavier font weight
              color: ColorsManager.blackPrimary,
            ),
          ),
          _buildSeeMoreButton(context),
        ],
      ),
    );
  }

  // See More Button with subtle hover effect
  Widget _buildSeeMoreButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle the tap event to navigate to the Popular Sights screen
        // navigateTo(context, routeName: PopularSightsScreen.routeName, arguments: ...);
      },
      child: Row(
        children: [
          Text(
            'See More',
            style: context.labelLarge
                ?.copyWith(fontWeight: FontWeightHelper.semiBold),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 24.sp,
            color: ColorsManager.primaryColor,
          ),
        ],
      ),
    );
  }
}
