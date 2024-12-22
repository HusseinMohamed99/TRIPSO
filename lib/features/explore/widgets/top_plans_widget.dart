part of './../../../core/helpers/export_manager/export_manager.dart';

class TopPlansWidget extends StatelessWidget {
  const TopPlansWidget({
    super.key,
    required this.cubit,
  });
  final TripsoCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildTitleSection(
          onTap: () {},
          title: 'Top Plans',
        ),
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
  }
}
