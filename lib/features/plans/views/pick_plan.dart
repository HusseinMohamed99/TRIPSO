part of '../../../core/helpers/export_manager/export_manager.dart';

class PickPlans extends StatelessWidget {
  const PickPlans({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: 'Select Your Place',
      ),
      body: BlocConsumer<TripsoCubit, TripsoStates>(
        listener: (context, state) {},
        builder: (context, state) {
          TripsoCubit tripsoCubit = context.read<TripsoCubit>();
          return CustomScrollView(
            slivers: [
              SliverList.separated(
                itemBuilder: (context, index) {
                  return GridPlans(
                    placeModel: tripsoCubit.place[index],
                  ).allPadding(
                    hPadding: 12,
                    vPadding: 10,
                  );
                },
                separatorBuilder: (context, index) {
                  return Space(height: 10, width: 0);
                },
                itemCount: tripsoCubit.place.length,
              ),
            ],
          );
        },
      ),
    );
  }
}
