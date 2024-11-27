import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/speak.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class HistoricalCity extends StatelessWidget {
  const HistoricalCity({super.key});
  static const String routeName = 'HistoricalCity';

  @override
  Widget build(BuildContext context) {
    CityModel cityModel =
        (ModalRoute.of(context)?.settings.arguments) as CityModel;
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 500.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(20).r,
                        bottomRight: const Radius.circular(20).r,
                      ),
                      // image: DecorationImage(
                      //   fit: BoxFit.fill,
                      //   image: NetworkImage(
                      //     cityModel.image,
                      //   ),
                      // ),
                    ),
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: cityModel.image,
                          fit: BoxFit.fill,
                          height: 400.h,
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
                        LayerImage(
                          height: 400.h,
                          width: double.infinity,
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(20).r,
                            bottomRight: const Radius.circular(20).r,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 280.h,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cityModel.name,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: ColorsManager.whiteColor),
                          ),
                          Space(height: 10.h, width: 0.w),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: ColorsManager.primaryColor,
                                size: 30.sp,
                              ),
                              Text(
                                cityModel.country.trim(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      color: ColorsManager.whiteColor,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    bottomNavigationBar: Container(
                      padding: EdgeInsets.only(
                        top: 5.h,
                        left: 20.w,
                        right: 20.w,
                      ),
                      height: 300.h,
                      decoration: BoxDecoration(
                          color: ColorsManager.whiteColor,
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(40).r,
                            topRight: const Radius.circular(40).r,
                          )),
                      child: ListView(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Space(height: 10.h, width: 0.w),
                              Text(
                                'Description',
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              ),
                              Space(height: 10.h, width: 0.w),
                              Text(
                                cityModel.history.trim(),
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                              Space(height: 30.h, width: 0.w),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                  top: 10.h,
                  left: 10.w,
                  child: Card(
                    elevation: 2,
                    color: ColorsManager.blackPrimary.withOpacity(0.5),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    shape: const StadiumBorder(
                      side: BorderSide(color: ColorsManager.whiteColor),
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
                        color: ColorsManager.whiteColor,
                        size: 24.sp,
                      ),
                    ),
                  )),
              Positioned(
                right: 10.h,
                top: 330.h,
                child: Card(
                  elevation: 2,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: const StadiumBorder(
                    side: BorderSide(
                      color: ColorsManager.whiteColor,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundColor: ColorsManager.whiteColor,
                    child: IconButton(
                      onPressed: () {
                        speak(cityModel.history);
                      },
                      icon: Icon(
                        Icons.record_voice_over,
                        color: ColorsManager.primaryColor,
                        size: 30.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
