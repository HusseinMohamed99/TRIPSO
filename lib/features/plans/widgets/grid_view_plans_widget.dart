part of './../../../core/helpers/export_manager/export_manager.dart';

class GridPlans extends StatelessWidget {
  const GridPlans({
    super.key,
    required this.placeModel,
  });

  final PlaceModel placeModel;
  @override
  Widget build(BuildContext context) {
    // NumOf numOf = (ModalRoute.of(context)?.settings.arguments) as NumOf;
    // Parse rating from string to int
    double rating = (double.tryParse(placeModel.rate) ?? 0).toDouble();
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: ColorsManager.whiteColor.withOpacity(0.6),
        child: Column(
          children: [
            Stack(
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
            ),
            const Space(
              height: 5,
              width: 0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTitle(
                    title: placeModel.name,
                  ),
                  buildRatingRow(rating).allPadding(vPadding: 6),
                  CustomTitle(
                    title: placeModel.history,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const MyDivider(
                    height: 0.5,
                    color: ColorsManager.blackPrimary,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(15)),
                        child: Align(
                          alignment: Alignment.center,
                          child: CustomTitle(
                            title: 'Tickets : ${placeModel.tickets}',
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              MapUtils.urlLauncher(
                                  Uri.parse(placeModel.location));
                            },
                            padding: const EdgeInsets.all(8),
                            icon: CircleAvatar(
                              backgroundColor: Colors.grey.shade400,
                              child: const Icon(
                                FontAwesomeIcons.locationArrow,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          CustomTitle(
                            title: 'Go',
                            // textAlign: TextAlign.center,
                            // style: GoogleFonts.roboto(
                            //     color: Colors.black,
                            //     fontSize: 12,
                            //     fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      placeModel.timeOfDay[0] == 'Closed' ||
                              placeModel.timeOfDay[1] == 'Closed' ||
                              placeModel.timeOfDay[2] == 'Closed' ||
                              placeModel.timeOfDay[3] == 'Closed' ||
                              placeModel.timeOfDay[4] == 'Closed' ||
                              placeModel.timeOfDay[5] == 'Closed' ||
                              placeModel.timeOfDay[6] == 'Closed'
                          ? Column(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    MyDialog.showAlertDialog(
                                      context,
                                      SizedBox(
                                        height: 370.h,
                                        child: Column(
                                          children: [
                                            ListTile(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    'Saturday:',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                  Text(
                                                    placeModel.timeOfDay[0],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ListTile(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    'Sunday:',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                  Text(
                                                    placeModel.timeOfDay[1],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ListTile(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    'Monday:',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                  Text(
                                                    placeModel.timeOfDay[2],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ListTile(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    'Tuesday:',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                  Text(
                                                    placeModel.timeOfDay[3],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ListTile(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    'Wednesday:',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                  Text(
                                                    placeModel.timeOfDay[4],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ListTile(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    'Thursday:',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                  Text(
                                                    placeModel.timeOfDay[5],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ListTile(
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Text(
                                                    'Friday:',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                  Text(
                                                    placeModel.timeOfDay[6],
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                MyDialog.hideDialog(context);
                                              },
                                              child: const Text('Close'),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  padding: const EdgeInsets.all(8),
                                  icon: const Icon(
                                    Icons.watch_later_outlined,
                                    size: 30,
                                    color: Colors.red,
                                  ),
                                ),
                                CustomTitle(
                                  title: 'Closed', color: Colors.red,
                                  // textAlign: TextAlign.center,
                                  // style: GoogleFonts.roboto(
                                  //
                                  //     fontSize: 12,
                                  //     fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  padding: const EdgeInsets.all(8),
                                  icon: const Icon(
                                    Icons.watch_later_outlined,
                                    size: 30,
                                    color: Colors.green,
                                  ),
                                ),
                                CustomTitle(
                                  title: 'Open', color: Colors.green,
                                  // textAlign: TextAlign.center,
                                  // style: GoogleFonts.roboto(
                                  //
                                  //     fontSize: 12,
                                  //     fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
