import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripso/mobile/screens/sights/sight_details_screen.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/styles/theme.dart';

List<Icon> icon5Star({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon4halfStar({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_half_outlined,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon4Star({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon3halfStar({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_half_outlined,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon3Star({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon2halfStar({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_half_outlined,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon2Star({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> icon1halfStar({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_half_outlined,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
  ];
}

List<Icon> iconStar({Color? color}) {
  return [
    Icon(
      Icons.star,
      color: color ?? ThemeApp.yellowColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
    Icon(
      Icons.star_border,
      color: color ?? ThemeApp.secondaryColor,
      size: 20.sp,
    ),
  ];
}

class GridItemSights extends StatelessWidget {
  const GridItemSights(
    this.index,
    this.cityModel, {
    Key? key,
    required this.placeModel,
  }) : super(key: key);

  final PlaceModel placeModel;
  final CityModel cityModel;
  final int index;
  final bool wishListBool = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20).r,
      onTap: () {
        navigateTo(
          context,
          routeName: SightDetailsScreen.routeName,
          arguments: ScreenArgs(placeModel: placeModel, cityModel: cityModel),
        );
      },
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Card(
            elevation: 2,
            color: ThemeApp.secondaryColor,
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
                        height: 263.h,
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
                      height: 263.h,
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
                                Theme.of(context).textTheme.headline3?.copyWith(
                                      color: ThemeApp.secondaryColor,
                                    ),
                          ),
                          if (placeModel.popular == '5')
                            Row(
                              children: icon5Star(),
                            ),
                          if (placeModel.popular == '4.5')
                            Row(
                              children: icon4halfStar(),
                            ),
                          if (placeModel.popular == '4')
                            Row(
                              children: icon4Star(),
                            ),
                          if (placeModel.popular == '3.5')
                            Row(
                              children: icon3halfStar(),
                            ),
                          if (placeModel.popular == '3')
                            Row(
                              children: icon3Star(),
                            ),
                          if (placeModel.popular == '2.5')
                            Row(
                              children: icon2halfStar(),
                            ),
                          if (placeModel.popular == '2')
                            Row(
                              children: icon2Star(),
                            ),
                          if (placeModel.popular == '1.5')
                            Row(
                              children: icon1halfStar(),
                            ),
                          if (placeModel.popular == '1')
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
                                    .headline5
                                    ?.copyWith(
                                      color: ThemeApp.secondaryColor,
                                    ),
                              ),
                              Space(height: 0.h, width: 10.w),
                              Icon(
                                FontAwesomeIcons.locationDot,
                                color: ThemeApp.primaryColor,
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
