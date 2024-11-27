part of './../../../core/helpers/export_manager/export_manager.dart';

class DestinationCitiesWidget extends StatelessWidget {
  const DestinationCitiesWidget({
    super.key,
    required this.tripsoCubit,
  });

  final TripsoCubit tripsoCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CarouselSliderWidget().onlyPadding(bottomPadding: 30.h),
            Positioned(
              top: 225.h,
              right: 10.w,
              left: 10.w,
              child: SearchBarItem(
                readOnly: true,
                function: () {
                  context.pushNamed(Routes.searchScreen);
                },
              ),
            ),
          ],
        ),
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 8).r,
                sliver: DisplayGridCities(cubit: tripsoCubit),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
