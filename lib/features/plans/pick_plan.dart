import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/features/plans/select_date_screen.dart';
import 'package:tripso/features/sights/sight_details_screen.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model/place_model.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/maps_utils.dart';
import 'package:tripso/shared/components/my_divider.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/show_toast.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class PickPlans extends StatefulWidget {
  const PickPlans({
    super.key,
  });

  @override
  State<PickPlans> createState() => _PickPlansState();
}

class _PickPlansState extends State<PickPlans> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {
        if (state is AddPlanSuccessState) {
          showToast(
            text: 'Add To Your Plan Successfully',
            state: ToastStates.success,
          );
        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                const PickPlansWidget(),
                Positioned(
                  top: 10.sp,
                  left: 10.sp,
                  child: Card(
                    elevation: 2,
                    color: Colors.black.withOpacity(0.5),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const StadiumBorder(
                      side: BorderSide(
                        color: ColorsManager.whiteColor,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (Navigator.canPop(context)) {
                          pop(context);
                          TripsoCubit.get(context).currentIndex = 0;
                        }
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: ColorsManager.whiteColor,
                        size: 24.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class PickPlansWidget extends StatelessWidget {
  const PickPlansWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
            child: ListViewWidget(cubit: cubit),
          ),
        );
      },
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.cubit,
  });

  final TripsoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return GridPlans(
                placeModel: cubit.place[index],
                cubit.cityModel!,
                cubit.bestPLanModel!);
          },
          separatorBuilder: (context, index) {
            return Space(height: 10.h, width: 0);
          },
          itemCount: cubit.place.length,
        ),
      ],
    );
  }
}

class GridPlans extends StatelessWidget {
  const GridPlans(
    this.cityModel,
    this.bestPLanModel, {
    super.key,
    required this.placeModel,
  });

  final PlaceModel placeModel;
  final CityModel cityModel;

  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    NumOf numOf = (ModalRoute.of(context)?.settings.arguments) as NumOf;

    return InkWell(
      borderRadius: BorderRadius.circular(20).r,
      onTap: () {
        navigateTo(
          context,
          routeName: SightDetailsScreen.routeName,
          arguments: ScreenArgs(
              placeModel: placeModel,
              cityModel: cityModel,
              bestPLanModel: bestPLanModel),
        );
      },
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                SizedBox(
                  height: 130.h,
                  width: 400.w,
                  child: CachedNetworkImage(
                    imageUrl: placeModel.image,
                    fit: BoxFit.fill,
                    height: 200.h,
                    width: double.infinity,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                      child: AdaptiveIndicator(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: AdaptiveIndicator(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0).r,
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: ColorsManager.primaryColor,
                    child: IconButton(
                      onPressed: () {
                        TripsoCubit.get(context).addMyPlan(
                          dateTime: DateTime.now(),
                          index: numOf.index,
                          planCityID: cityModel.cId,
                          planName: placeModel.name,
                          planImage: placeModel.image,
                          planHistory: placeModel.history,
                          planLocation: placeModel.location,
                          planTimeOfDay: placeModel.timeOfDay,
                          planTickets: placeModel.tickets,
                          planId: placeModel.pId,
                          planAddress: placeModel.address,
                          planRate: placeModel.rate,
                          planIsPopular: placeModel.isPopular,
                          indexOfDay: numOf.numOfDays,
                        );
                        if (kDebugMode) {
                          print(placeModel.isPopular);
                        }
                        if (kDebugMode) {
                          print('CityID ===== ${cityModel.cId}');
                        }
                        if (kDebugMode) {
                          print('indexOfDay ===== ${numOf.numOfDays}');
                        }
                        if (kDebugMode) {
                          print('index ===== ${numOf.index}');
                        }
                      },
                      icon: Icon(
                        Icons.add,
                        size: 25.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
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
                  Text(
                    placeModel.name,
                    style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                  ),
                  Space(
                    height: 6.h,
                    width: 0,
                  ),
                  // if (placeModel.rate == '5')
                  //   Row(
                  //     children: icon5Star(color: ColorsManager.primaryColor),
                  //   ),
                  // if (placeModel.rate == '4.5')
                  //   Row(
                  //     children:
                  //         icon4halfStar(color: ColorsManager.primaryColor),
                  //   ),
                  // if (placeModel.rate == '4')
                  //   Row(
                  //     children: icon4Star(color: ColorsManager.primaryColor),
                  //   ),
                  // if (placeModel.rate == '3.5')
                  //   Row(
                  //     children:
                  //         icon3halfStar(color: ColorsManager.primaryColor),
                  //   ),
                  // if (placeModel.rate == '3')
                  //   Row(
                  //     children: icon3Star(color: ColorsManager.primaryColor),
                  //   ),
                  // if (placeModel.rate == '2.5')
                  //   Row(
                  //     children:
                  //         icon2halfStar(color: ColorsManager.primaryColor),
                  //   ),
                  // if (placeModel.rate == '2')
                  //   Row(
                  //     children: icon2Star(color: ColorsManager.primaryColor),
                  //   ),
                  // if (placeModel.rate == '1.5')
                  //   Row(
                  //     children:
                  //         icon1halfStar(color: ColorsManager.primaryColor),
                  //   ),
                  // if (placeModel.rate == '1')
                  //   Row(
                  //     children: iconStar(color: ColorsManager.primaryColor),
                  //   ),
                  const Space(
                    height: 6,
                    width: 0,
                  ),
                  Text(
                    placeModel.history,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.roboto(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black54,
                    ),
                  ),
                  const MyDivider(
                    height: 0.5,
                    color: Colors.black,
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
                          child: Text(
                            'Tickets : ${placeModel.tickets}',
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp),
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
                          Text(
                            'Go',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w600),
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
                                Text(
                                  'Closed',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
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
                                Text(
                                  'Open',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      color: Colors.green,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
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
