part of '../../../core/helpers/export_manager/export_manager.dart';

class PickPlans extends StatelessWidget {
  const PickPlans({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TripsoCubit, TripsoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GridPlans(
                placeModel: context.read<TripsoCubit>().place[index],
              );
            },
            separatorBuilder: (context, index) {
              return Space(height: 10, width: 0);
            },
            itemCount: context.read<TripsoCubit>().place.length,
          );
        },
      ),
    );
  }
}
