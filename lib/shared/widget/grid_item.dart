import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/features/sights/sight_details_screen.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';

List<Icon> icon5Star({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon4halfStar({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_half_outlined,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon4Star({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon3halfStar({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_half_outlined,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon3Star({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon2halfStar({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_half_outlined,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon2Star({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon1halfStar({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_half_outlined,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> iconStar({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ColorsManager.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ColorsManager.secondaryColor,
      size: 20.sp,
    ),
  ];
}

class GridItemSights extends StatelessWidget {
  const GridItemSights(
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
        if (kDebugMode) {
          print(placeModel.pId);
        }
      },
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Card(
            elevation: 2,
            color: ColorsManager.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12).r,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12).r,
                      child: CachedNetworkImage(
                        imageUrl: placeModel.image,
                        fit: BoxFit.cover,
                        height: 220.h,
                        width: double.infinity,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: AdaptiveIndicator(
                            os: getOs(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          FontAwesomeIcons.info,
                          size: 24.sp,
                        ),
                      ),
                    ),
                    LayerImage(
                      height: 220.h,
                      width: double.infinity,
                      borderRadius: BorderRadius.circular(12).r,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0).r,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            placeModel.name.trim(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      color: ColorsManager.secondaryColor,
                                    ),
                          ),
                          if (placeModel.rate == '5')
                            Row(
                              children: icon5Star(),
                            ),
                          if (placeModel.rate == '4.5')
                            Row(
                              children: icon4halfStar(),
                            ),
                          if (placeModel.rate == '4')
                            Row(
                              children: icon4Star(),
                            ),
                          if (placeModel.rate == '3.5')
                            Row(
                              children: icon3halfStar(),
                            ),
                          if (placeModel.rate == '3')
                            Row(
                              children: icon3Star(),
                            ),
                          if (placeModel.rate == '2.5')
                            Row(
                              children: icon2halfStar(),
                            ),
                          if (placeModel.rate == '2')
                            Row(
                              children: icon2Star(),
                            ),
                          if (placeModel.rate == '1.5')
                            Row(
                              children: icon1halfStar(),
                            ),
                          if (placeModel.rate == '1')
                            Row(
                              children: iconStar(),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                TripsoCubit.get(context).cityModel!.country,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: ColorsManager.secondaryColor,
                                    ),
                              ),
                              Space(height: 0.h, width: 10.w),
                              Icon(
                                FontAwesomeIcons.locationDot,
                                color: ColorsManager.primaryColor,
                                size: 25.sp,
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
        ],
      ),
    );
  }
}
