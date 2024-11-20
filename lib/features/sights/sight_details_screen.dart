import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/maps_utils.dart';
import 'package:tripso/shared/components/my_divider.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/show_toast.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/speak.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class SightDetailsScreen extends StatelessWidget {
  const SightDetailsScreen({super.key});
  static const String routeName = 'SightDetailsScreen';

  @override
  Widget build(BuildContext context) {
    ScreenArgs screenArgs =
        (ModalRoute.of(context)?.settings.arguments) as ScreenArgs;

    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {
        if (state is AddToFavoriteSuccessState) {
          showToast(
            text: 'Add To Favorite Successfully',
            state: ToastStates.success,
          );
        }
      },
      builder: (context, state) {
        var tripso = TripsoCubit.get(context);
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
                            SizedBox(
                              height: 300.h,
                              width: double.infinity,
                              child: CachedNetworkImage(
                                imageUrl: screenArgs.placeModel.image,
                                fit: BoxFit.fill,
                                height: 200.h,
                                width: double.infinity,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: AdaptiveIndicator(os: getOs()),
                                ),
                                errorWidget: (context, url, error) => Center(
                                  child: AdaptiveIndicator(os: getOs()),
                                ),
                              ),
                            ),
                            LayerImage(
                              height: 300.h,
                              width: double.infinity,
                              borderRadius: BorderRadius.only(
                                bottomLeft: const Radius.circular(0).r,
                                bottomRight: const Radius.circular(0).r,
                              ),
                            ),
                            Positioned(
                              top: 15.h,
                              left: 20.w,
                              child: Card(
                                elevation: 2,
                                color:
                                    ColorsManager.blackPrimary.withOpacity(0.5),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const StadiumBorder(
                                  side: BorderSide(
                                    color: ColorsManager.secondaryColor,
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
                                    color: ColorsManager.secondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 15.h,
                          right: 20.w,
                          child: CircleAvatar(
                            radius: 20.r,
                            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
                            child: IconButton(
                              onPressed: () {
                                tripso.addWishList(
                                  wishListCityID: screenArgs.cityModel.cId,
                                  wishListName: screenArgs.placeModel.name,
                                  wishListImage: screenArgs.placeModel.image,
                                  wishListHistory:
                                      screenArgs.placeModel.history,
                                  wishListLocation:
                                      screenArgs.placeModel.location,
                                  wishListTimeOfDay:
                                      screenArgs.placeModel.timeOfDay,
                                  wishListTickets:
                                      screenArgs.placeModel.tickets,
                                  wishListId: screenArgs.placeModel.pId,
                                  wishListAddress:
                                      screenArgs.placeModel.address,
                                  wishListRate: screenArgs.placeModel.rate,
                                  wishListIsPopular:
                                      screenArgs.placeModel.isPopular,
                                );
                              },
                              icon: Icon(
                                FontAwesomeIcons.heart,
                                size: 24.sp,
                                color: ColorsManager.secondaryColor,
                                // color: ThemeApp.secondaryColor,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0).r,
                          child: Text(
                            screenArgs.placeModel.name,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  color: ColorsManager.secondaryColor,
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
                                              .titleLarge
                                              ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Text(
                                          screenArgs.placeModel.tickets,
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                color: ColorsManager
                                                    .secondaryColor,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Space(height: 0.h, width: 20.w),
                                TextButton.icon(
                                  onPressed: () {
                                    speak(screenArgs.placeModel.history);
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor: ColorsManager.primaryColor,
                                    child: Icon(
                                      FontAwesomeIcons.circlePlay,
                                      size: 24.sp,
                                      color: ColorsManager.secondaryColor,
                                    ),
                                  ),
                                  label: const Text(''),
                                ),
                                TextButton.icon(
                                  onPressed: () {
                                    MapUtils.urlLauncher(
                                      Uri.parse(
                                        screenArgs.placeModel.location.trim(),
                                      ),
                                    );
                                  },
                                  icon: CircleAvatar(
                                    backgroundColor: ColorsManager.primaryColor,
                                    child: Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 24.sp,
                                      color: ColorsManager.secondaryColor,
                                    ),
                                  ),
                                  label: const Text(''),
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
                                  screenArgs.placeModel.history.trim(),
                                  maxLines: 5,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        color: ColorsManager.blackPrimary
                                            .withOpacity(
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
                                        .titleLarge
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
                                    color: ColorsManager.primaryColor,
                                  ),
                                  Space(height: 0.h, width: 20.w),
                                  Expanded(
                                    child: Text(
                                      screenArgs.placeModel.address.trim(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              color:
                                                  ColorsManager.blackPrimary),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ExpansionTile(
                              tilePadding:
                                  const EdgeInsets.symmetric(horizontal: 8.0).r,
                              leading: Icon(
                                FontAwesomeIcons.clock,
                                color: ColorsManager.primaryColor,
                                size: 24.sp,
                              ),
                              title: Text(
                                'Open',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: ColorsManager.blackPrimary),
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
                                            .titleLarge,
                                      ),
                                      Text(
                                        screenArgs.placeModel.timeOfDay[0],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
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
                                            .titleLarge,
                                      ),
                                      Text(
                                        screenArgs.placeModel.timeOfDay[1],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
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
                                            .titleLarge,
                                      ),
                                      Text(
                                        screenArgs.placeModel.timeOfDay[2],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
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
                                            .titleLarge,
                                      ),
                                      Text(
                                        screenArgs.placeModel.timeOfDay[3],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
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
                                            .titleLarge,
                                      ),
                                      Text(
                                        screenArgs.placeModel.timeOfDay[4],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
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
                                            .titleLarge,
                                      ),
                                      Text(
                                        screenArgs.placeModel.timeOfDay[5],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
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
                                            .titleLarge,
                                      ),
                                      Text(
                                        screenArgs.placeModel.timeOfDay[6],
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
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
    ScreenArgs screenArgs =
        (ModalRoute.of(context)?.settings.arguments) as ScreenArgs;
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: ColorsManager.secondaryColor,
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
                color: ColorsManager.secondaryColor,
                borderRadius:
                    BorderRadius.vertical(top: const Radius.circular(20).r),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10).r,
              margin: const EdgeInsets.symmetric(horizontal: 10).r,
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
                        color: ColorsManager.primaryColor,
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
                          screenArgs.placeModel.name.trim(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                    const MyDivider(),
                    Space(height: 15.h, width: 0.w),
                    Text(
                      screenArgs.placeModel.history.trim(),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: ColorsManager.blackPrimary.withOpacity(
                              0.54,
                            ),
                          ),
                    ),
                    Space(height: 20.h, width: 0.w),
                    TextButton(
                      onPressed: () {
                        speak(screenArgs.placeModel.history);
                      },
                      child: CircleAvatar(
                          radius: 24.r,
                          backgroundColor: ColorsManager.primaryColor,
                          child: Icon(
                            FontAwesomeIcons.play,
                            color: ColorsManager.secondaryColor,
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
