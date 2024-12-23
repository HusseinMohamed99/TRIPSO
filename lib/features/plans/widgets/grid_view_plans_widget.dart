part of './../../../core/helpers/export_manager/export_manager.dart';

class GridPlans extends StatelessWidget {
  const GridPlans({
    super.key,
    required this.placeModel,
  });
  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    double rating = double.tryParse(placeModel.rate) ?? 0;
    return GestureDetector(
      onTap: () {
        // navigateTo(
        //   context,
        //   routeName: SightDetailsScreen.routeName,
        //   arguments: ScreenArgs(
        //       placeModel: placeModel,
        //       cityModel: cityModel,
        //       bestPLanModel: bestPLanModel),
        // );
      },
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: ColorsManager.whiteColor.withOpacity(0.6),
        child: Column(
          children: [
            CustomSightImage(placeModel: placeModel),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTitle(title: placeModel.name).onlyPadding(topPadding: 5),
                buildRatingRow(rating).allPadding(vPadding: 6),
                CustomTitle(
                  title: placeModel.history,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const MyDivider(height: 0.5, color: ColorsManager.blackPrimary)
                    .onlyPadding(topPadding: 5),
                _buildActionRow(context),
              ],
            ).allPadding(hPadding: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildActionRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildTicketInfo(),
        _buildLocationButton(),
        _buildTimeButton(context),
      ],
    );
  }

  Widget _buildTicketInfo() {
    return Container(
      width: 90.w,
      height: 25.h,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Align(
        alignment: Alignment.center,
        child: CustomTitle(title: 'Tickets: ${placeModel.tickets}'),
      ),
    );
  }

  Widget _buildLocationButton() {
    return IconButton(
      onPressed: () {
        MapUtils.urlLauncher(Uri.parse(placeModel.location));
      },
      icon: Icon(
        FontAwesomeIcons.locationArrow,
        size: 24.sp,
        color: ColorsManager.blackPrimary,
      ),
    );
  }

  Widget _buildTimeButton(BuildContext context) {
    Icon icon = Icon(
      Icons.watch_later_outlined,
      size: 24.sp,
      color: Colors.green,
    );
    return IconButton(
      onPressed: () => _showTimeDialog(context),
      icon: icon,
    );
  }

  void _showTimeDialog(BuildContext context) {
    MyDialog.showAlertDialog(
      context,
      SizedBox(
        height: context.height * 0.5,
        width: context.width,
        child: Column(
          children: List.generate(
            7,
            (index) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTitle(
                      title: _getDayName(index),
                    ),
                    CustomTitle(
                      title: placeModel.timeOfDay[index],
                      color: placeModel.timeOfDay[index] == 'Closed'
                          ? ColorsManager.redColor
                          : ColorsManager.greenColor,
                    ),
                  ],
                ),
              );
            },
          )..add(
              TextButton(
                onPressed: () {
                  MyDialog.hideDialog(context);
                },
                child: CustomTitle(
                  title: 'Close',
                  color: ColorsManager.primaryColor,
                ),
              ),
            ),
        ),
      ),
    );
  }

  String _getDayName(int index) {
    const days = [
      'Saturday',
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday'
    ];
    return days[index];
  }
}
