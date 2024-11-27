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
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Plans',
                    style: GoogleFonts.roboto(
                      fontSize: 19.sp,
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: Row(
                      children: [
                        const Text(
                          'See More',
                          style: TextStyle(
                            color: ColorsManager.primaryColor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0.sp,
                          color: ColorsManager.primaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TopPlanItem(
                    cityModel: cubit.cityModel!,
                    placeModel: cubit.placeModel!,
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
}
