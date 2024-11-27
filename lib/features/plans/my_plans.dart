import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/core/styles/asset_path.dart';
import 'package:tripso/features/plans/select_date_screen.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/plan_model.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/components/maps_utils.dart';
import 'package:tripso/shared/components/my_divider.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class MyPlansScreen extends StatefulWidget {
  const MyPlansScreen({super.key});
  static const String routeName = 'MyPlans';

  @override
  State<MyPlansScreen> createState() => _MyPlansScreenState();
}

class _MyPlansScreenState extends State<MyPlansScreen> {
  List<String> items = [
    "Day\n1",
    "Day\n2",
    "Day\n3",
    "Day\n4",
    "Day\n5",
    "Day\n6",
    "Day\n7",
  ];
  int current = 0;
  late final PlanModel planModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TripsoCubit.get(context);
        var tripsoCubit = TripsoCubit.get(context).cityModel;
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: ColorsManager.primaryColor,
            onPressed: () {
              Navigator.pushNamed(context, SelectDateScreen.routeName);
            },
            child: const Icon(Icons.add),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF5B818B),
                Color(0xFF97B0B6),
              ]),
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 39.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(0).r,
                  ),
                  child: SizedBox(
                    height: 60.h,
                    width: double.infinity,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16).r,
                        physics: const BouncingScrollPhysics(),
                        itemCount: items.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                current = index;
                                TripsoCubit.get(context)
                                    .getDataPlaces(tripsoCubit!.cId);
                                TripsoCubit.get(context)
                                    .fetchCityData(tripsoCubit.cId);
                                TripsoCubit.get(context).getMyAllPlan(
                                    tripsoCubit.cId, uId, current + 1);
                                if (kDebugMode) {
                                  print(current + 1);
                                }
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 300),
                              margin: const EdgeInsets.all(4).r,
                              width: 37.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                  color: current == index
                                      ? ColorsManager.primaryColor
                                      : ColorsManager.whiteColor,
                                  borderRadius: current == index
                                      ? BorderRadius.circular(22).r
                                      : BorderRadius.circular(22).r,
                                  border: current == index
                                      ? Border.all(
                                          color: ColorsManager.primaryColor,
                                          width: 4.w,
                                        )
                                      : null),
                              child: Center(
                                child: Text(
                                  items[index],
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.w500,
                                      color: current == index
                                          ? Colors.white
                                          : Colors.grey,
                                      fontSize: 12.sp),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                if (cubit.allPlan.isNotEmpty)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.separated(
                            padding: const EdgeInsets.all(10).r,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return DaysOfItems(
                                planModel: cubit.allPlan[index],
                                cityModel: tripsoCubit!,
                                current: current + 1,
                              );
                            },
                            separatorBuilder: (context, index) {
                              return Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        width: 5.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          color: ColorsManager.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5).r,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 2)
                                            .r,
                                        width: 5.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          color: ColorsManager.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5).r,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                                horizontal: 50, vertical: 2)
                                            .r,
                                        width: 5.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          color: ColorsManager.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5).r,
                                        ),
                                      ),
                                      Icon(
                                        Icons.free_breakfast_outlined,
                                        color: Colors.white,
                                        size: 25.sp,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 50,
                                          vertical: 2,
                                        ).r,
                                        width: 5.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          color: ColorsManager.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5).r,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 50,
                                          vertical: 2,
                                        ).r,
                                        width: 5.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          color: ColorsManager.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5).r,
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 50,
                                          vertical: 2,
                                        ).r,
                                        width: 5.w,
                                        height: 5.h,
                                        decoration: BoxDecoration(
                                          color: ColorsManager.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(5).r,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '30 mins Break',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15.sp,
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: cubit.allPlan.length,
                          )
                        ],
                      ),
                    ),
                  )
                else
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        Container(
                          width: double.infinity,
                          height: 220.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18).r,
                            image: const DecorationImage(
                              image: AssetImage(AssetPath.emptyImage),
                            ),
                          ),
                        ),
                        Text(
                          'Your ${tripsoCubit!.name} Plan is Empty',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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

class DaysOfItems extends StatelessWidget {
  const DaysOfItems(
      {super.key,
      required this.planModel,
      required this.cityModel,
      required this.current});
  final int current;
  final PlanModel planModel;
  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15).r),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 120.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)).r,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            planModel.planImage,
                          ),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(10).r,
                      width: 75.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15).r,
                        color: Colors.white,
                        border: Border.all(
                          width: 1.w,
                          color: Colors.black,
                        ),
                      ),
                      child: IconButton(
                        onPressed: () {
                          TripsoCubit.get(context)
                              .deleteMyPlan(planModel.planId, current);
                        },
                        icon: const Icon(Icons.delete_forever),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0).r,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            planModel.planName,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Text(
                          '2 hours',
                          style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Space(
                      width: 0,
                      height: 7.h,
                    ),
                    Text(
                      planModel.planHistory,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: GoogleFonts.roboto(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.black54,
                      ),
                    ),
                    Space(
                      width: 0,
                      height: 5.h,
                    ),
                    const MyDivider(
                      width: double.infinity,
                      height: 0.5,
                      color: Colors.black,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tickets',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            planModel.planTickets,
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w600,
                              color: ColorsManager.blueColor,
                              fontSize: 22.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                    const MyDivider(
                      height: 0.5,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {
                                MapUtils.urlLauncher(
                                  Uri.parse(
                                    planModel.planLocation..trim(),
                                  ),
                                );
                              },
                              icon: Container(
                                padding: const EdgeInsets.all(2).r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15).r,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1.w,
                                  ),
                                ),
                                child: Icon(
                                  FontAwesomeIcons.locationArrow,
                                  size: 24.sp,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Text(
                              'Go',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        planModel.planTimeOfDay[0] == 'Closed' ||
                                planModel.planTimeOfDay[1] == 'Closed' ||
                                planModel.planTimeOfDay[2] == 'Closed' ||
                                planModel.planTimeOfDay[3] == 'Closed' ||
                                planModel.planTimeOfDay[4] == 'Closed' ||
                                planModel.planTimeOfDay[5] == 'Closed' ||
                                planModel.planTimeOfDay[6] == 'Closed'
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
                                                      planModel
                                                          .planTimeOfDay[0],
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
                                                      planModel
                                                          .planTimeOfDay[1],
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
                                                      planModel
                                                          .planTimeOfDay[2],
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
                                                      planModel
                                                          .planTimeOfDay[3],
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
                                                      planModel
                                                          .planTimeOfDay[4],
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
                                                      planModel
                                                          .planTimeOfDay[5],
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
                                                      planModel
                                                          .planTimeOfDay[6],
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
        );
      },
    );
  }
}
