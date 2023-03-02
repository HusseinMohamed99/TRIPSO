import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tripso/mobile/screens/sights/sight_details_screen.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/styles/theme.dart';

List<Icon> icon5Star = [
  Icon(
    Icons.star,
    color: ThemeApp.yellowColor,
    size: 15.sp,
  ),
  Icon(
    Icons.star,
    color: ThemeApp.yellowColor,
    size: 15.sp,
  ),
  Icon(
    Icons.star,
    color: ThemeApp.yellowColor,
    size: 15.sp,
  ),
  Icon(
    Icons.star,
    color: ThemeApp.yellowColor,
    size: 15.sp,
  ),
  Icon(
    Icons.star,
    color: ThemeApp.yellowColor,
    size: 15.sp,
  ),
];

List<Icon> iconStar = [
  Icon(
    Icons.star,
    color: ThemeApp.yellowColor,
    size: 15.sp,
  ),
  Icon(
    Icons.star,
    color: ThemeApp.yellowColor,
    size: 15.sp,
  ),
  Icon(
    Icons.star,
    color: ThemeApp.yellowColor,
    size: 15.sp,
  ),
  Icon(
    Icons.star_border,
    color: ThemeApp.blackPrimary,
    size: 15.sp,
  ),
  Icon(
    Icons.star_border,
    color: ThemeApp.blackPrimary,
    size: 15.sp,
  ),
];

class GridItemSights extends StatelessWidget {
  const GridItemSights({
    Key? key,
    required this.placeModel,
  }) : super(key: key);

  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20).r,
      onTap: () {
        navigateTo(
          context,
          routeName: SightDetailsScreen.routeName,
          arguments: PlaceModel(
            history: placeModel.history,
            image: placeModel.image,
            name: placeModel.name,
            timeOfDay: placeModel.timeOfDay,
            tickets: placeModel.tickets,
            location: placeModel.location,
            pId: placeModel.pId,
            isPopular: placeModel.isPopular,
            address: placeModel.address,
            popular: placeModel.popular,
          ),
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
                        height: 400.h,
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
                      height: 400.h,
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
                          if (placeModel.isPopular == true)
                            Row(
                              children: icon5Star,
                            ),
                          Row(
                            children: [
                              Icon(
                                FontAwesomeIcons.locationDot,
                                color: ThemeApp.primaryColor,
                                size: 25.sp,
                              ),
                              Space(height: 0.h, width: 10.w),
                              Text(
                                TripsoCubit.get(context).cityModel!.country,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                  color: ThemeApp.secondaryColor,
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
          Positioned(
            top: 15.h,
            right: 20.w,
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: const Color.fromRGBO(0, 0, 0, 0.6),
              child: IconButton(
                onPressed: () {
                  debugPrint('isFav');
                },
                icon: Icon(
                  FontAwesomeIcons.solidHeart,
                  size: 24.sp,
                  color: ThemeApp.secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
