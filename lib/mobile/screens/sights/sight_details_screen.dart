import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/my_divider.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/speak.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/theme.dart';

class SightDetailsScreen extends StatelessWidget {
  const SightDetailsScreen({Key? key}) : super(key: key);
  static const String routeName = 'SightDetailsScreen';

  @override
  Widget build(BuildContext context) {
    PlaceModel placeModel =
        (ModalRoute.of(context)?.settings.arguments) as PlaceModel;

    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: const Radius.circular(20).r,
                      bottomLeft: const Radius.circular(20).r,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Stack(
                          children: [
                            Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              height: 200.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  //     image: DecorationImage(
                                  //   fit: BoxFit.fill,
                                  //   image: NetworkImage(
                                  //     placeModel.image,
                                  //   ),
                                  // ),
                                  ),
                              child: CachedNetworkImage(
                                imageUrl: placeModel.image,
                                fit: BoxFit.fill,
                                height: 200.h,
                                width: double.infinity,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: AdaptiveIndicator(
                                    os: getOs(),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Center(
                                  child: AdaptiveIndicator(
                                    os: getOs(),
                                  ),
                                ),
                              ),
                            ),
                            LayerImage(
                              height: 200.h,
                              width: double.infinity,
                              borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(0).r,
                                bottomRight: const Radius.circular(0).r,
                              ),
                            ),
                            Positioned(
                                top: 20.h,
                                left: 10.w,
                                child: Card(
                                  elevation: 2,
                                  color: ThemeApp.blackPrimary.withOpacity(0.5),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  shape: const StadiumBorder(
                                    side: BorderSide(
                                      color: ThemeApp.secondaryColor,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () async {
                                      if (Navigator.canPop(context)) {
                                        pop(context);
                                      }
                                      await flutterTts.pause();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      size: 24.sp,
                                      color: ThemeApp.secondaryColor,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: Text(
                            placeModel.name,
                            style:
                                Theme.of(context).textTheme.headline2?.copyWith(
                                      color: ThemeApp.secondaryColor,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0).r,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 8,
                                    ).r,
                                    margin: const EdgeInsets.all(8).r,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20).r,
                                      color: const Color.fromRGBO(
                                          255, 154, 3, 0.6),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Tickets :',
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          placeModel.tickets,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6
                                              ?.copyWith(
                                                color: ThemeApp.secondaryColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Space(height: 0.h, width: 20.w),
                                TextButton.icon(
                                  onPressed: () {
                                    speak(placeModel.history);
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor: ThemeApp.primaryColor,
                                    child: Icon(
                                      FontAwesomeIcons.circlePlay,
                                      size: 24.sp,
                                      color: ThemeApp.secondaryColor,
                                    ),
                                  ),
                                  label: Text(
                                    '',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    // Google Maps
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor: ThemeApp.primaryColor,
                                    child: Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 24.sp,
                                      color: ThemeApp.secondaryColor,
                                    ),
                                  ),
                                  label: Text(
                                    '',
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ],
                            ),
                            MyDivider(
                              color: Colors.grey.shade200,
                            ),
                            Space(height: 10.h, width: 0.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  placeModel.history.trim(),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      ?.copyWith(
                                        color:
                                            ThemeApp.blackPrimary.withOpacity(
                                          0.54,
                                        ),
                                      ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    showBottomSheet(context);
                                  },
                                  child: Text(
                                    'Read more',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                            color: const Color.fromARGB(
                                                255, 80, 159, 175)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0).r,
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.earthAmericas,
                                    size: 24.sp,
                                    color: ThemeApp.primaryColor,
                                  ),
                                  Space(height: 0.h, width: 20.w),
                                  Expanded(
                                    child: Text(
                                      placeModel.address.trim(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              color: ThemeApp.blackPrimary),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //  Space(height: 10.h, width: 0.w),
                            ExpansionTile(
                              tilePadding:
                                  const EdgeInsets.symmetric(horizontal: 8.0).r,
                              leading: Icon(
                                FontAwesomeIcons.clock,
                                color: ThemeApp.primaryColor,
                                size: 24.sp,
                              ),
                              title: Text(
                                'Open',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: ThemeApp.blackPrimary),
                              ),
                              children: [
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Saturday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Text(
                                        placeModel.timeOfDay[0],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Sunday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Text(
                                        placeModel.timeOfDay[1],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Monday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Text(
                                        placeModel.timeOfDay[2],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Tuesday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Text(
                                        placeModel.timeOfDay[3],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Wednesday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Text(
                                        placeModel.timeOfDay[4],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Thursday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Text(
                                        placeModel.timeOfDay[5],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  title: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Friday',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      Text(
                                        placeModel.timeOfDay[6],
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Google Maps
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20).r,
                          child: Card(
                            margin: EdgeInsets.zero,
                            elevation: 2,
                            // color: Colors.red,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://img.freepik.com/premium-vector/map-with-gps-destination-point_34645-903.jpg?w=996',
                              fit: BoxFit.fill,
                              height: 200.h,
                              width: double.infinity,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: AdaptiveIndicator(
                                  os: getOs(),
                                ),
                              ),
                              errorWidget: (context, url, error) => Center(
                                child: AdaptiveIndicator(
                                  os: getOs(),
                                ),
                              ),
                            ),
                            // Image.network(
                            //   'https://img.freepik.com/premium-vector/map-with-gps-destination-point_34645-903.jpg?w=996',
                            //   width: double.infinity,
                            // ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showBottomSheet(BuildContext context) {
    PlaceModel placeModel =
        (ModalRoute.of(context)?.settings.arguments) as PlaceModel;
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: ThemeApp.secondaryColor,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: const Radius.circular(25.0).r,
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.3.sp,
            minChildSize: 0.2.spMin,
            maxChildSize: 0.62.spMax,
            expand: false,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  decoration: BoxDecoration(
                    color: ThemeApp.secondaryColor,
                borderRadius:
                    BorderRadius.vertical(top: const Radius.circular(20).r),
              ),
                  padding: const EdgeInsets.symmetric(horizontal: 8).r,
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: -20.h,
                        child: Container(
                          width: 50.w,
                          height: 6.h,
                          margin: const EdgeInsets.only(bottom: 20).r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.5).r,
                            color: ThemeApp.primaryColor,
                          ),
                        ),
                      ),
                      Space(height: 20.h, width: 0.w),
                      Column(children: [
                        Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  pop(context);
                                  await flutterTts.pause();
                                },
                                icon: Icon(
                                  Icons.clear,
                                  size: 24.sp,
                                )),
                            Text(
                              placeModel.name.trim(),
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline4,
                            )
                          ],
                        ),
                        const MyDivider(),
                        Space(height: 15.h, width: 0.w),
                        Text(
                          placeModel.history.trim(),
                      style: Theme.of(context).textTheme.headline6?.copyWith(
                            color: ThemeApp.blackPrimary.withOpacity(
                              0.54,
                            ),
                          ),
                    ),
                        Space(height: 20.h, width: 0.w),
                        TextButton(
                          onPressed: () {
                            speak(placeModel.history);
                          },
                          child: CircleAvatar(
                              radius: 24.r,
                              backgroundColor: ThemeApp.primaryColor,
                              child: Icon(
                                FontAwesomeIcons.play,
                                color: ThemeApp.secondaryColor,
                                size: 24.sp,
                              )),
                        ),
                      ]),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}
