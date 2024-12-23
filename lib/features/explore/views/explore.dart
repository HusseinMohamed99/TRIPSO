part of './../../../core/helpers/export_manager/export_manager.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tripsoCubit = context.read<TripsoCubit>();
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            CityInformationWidget(
              tripsoCubit: tripsoCubit,
            ),
            ExploreDestinationItem(
              tripsoCubit: tripsoCubit,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: PopularSightsWidget(
                      cubit: tripsoCubit,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Space(height: 16, width: 0),
                  ),
                  SliverToBoxAdapter(
                    child: TopPlansWidget(
                      cubit: tripsoCubit,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
