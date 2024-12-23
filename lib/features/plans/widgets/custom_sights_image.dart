part of './../../../core/helpers/export_manager/export_manager.dart';

class CustomSightImage extends StatelessWidget {
  const CustomSightImage({
    super.key,
    required this.placeModel,
  });
  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        CustomCachedNetworkImage(
          image: placeModel.image,
          fit: BoxFit.fill,
          imageHeight: 130,
        ),
        CircleAvatar(
          radius: 20.r,
          backgroundColor: ColorsManager.primaryColor,
          child: IconButton(
            onPressed: () {
              // TripsoCubit.get(context).addMyPlan(
              //   dateTime: DateTime.now(),
              //   index: numOf.index,
              //   planCityID: cityModel.cId,
              //   planName: placeModel.name,
              //   planImage: placeModel.image,
              //   planHistory: placeModel.history,
              //   planLocation: placeModel.location,
              //   planTimeOfDay: placeModel.timeOfDay,
              //   planTickets: placeModel.tickets,
              //   planId: placeModel.pId,
              //   planAddress: placeModel.address,
              //   planRate: placeModel.rate,
              //   planIsPopular: placeModel.isPopular,
              //   indexOfDay: numOf.numOfDays,
              // );
            },
            icon: Icon(
              Icons.add,
              size: 24.sp,
              color: ColorsManager.whiteColor,
            ),
          ),
        ).allPadding(
          hPadding: 5,
          vPadding: 5,
        ),
      ],
    );
  }
}
