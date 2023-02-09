import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/mobile/screens/sights/sights.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/colors.dart';

List<Icon> iconStar = [
  Icon(
    Icons.star,
    color: Colors.yellowAccent,
    size: 15.sp,
  ),
  Icon(
    Icons.star,
    color: Colors.yellowAccent,
    size: 15.sp,
  ),
  Icon(
    Icons.star,
    color: Colors.yellowAccent,
    size: 15.sp,
  ),
  Icon(
    Icons.star,
    color: Colors.yellowAccent,
    size: 15.sp,
  ),
  Icon(
    Icons.star,
    color: Colors.yellowAccent,
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
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        navigateTo(
          context,
          routeName: SightsScreen.routeName,
          arguments: PlaceModel(
            history: placeModel.history,
            image: placeModel.image,
            name: placeModel.name,
            hours: placeModel.hours,
            tickets: placeModel.tickets,
            location: placeModel.location,
            pId: placeModel.pId,
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Card(
            elevation: 6,
            color: secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image(
                        image: NetworkImage(
                          placeModel.image,
                        ),
                        height: 400.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    LayerImage(
                      height: 400.h,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            placeModel.name.trim(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.headline3?.copyWith(
                                      color: secondaryColor,
                                    ),
                          ),
                          Row(
                            children: iconStar,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                color: secondaryColor,
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
                                      color: secondaryColor,
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
            top: 15.sp,
            right: 20.sp,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade800,
              child: IconButton(
                onPressed: () {
                  debugPrint('isFav');
                },
                icon: const ImageIcon(
                  AssetImage(
                    AssetPath.wishlistImage,
                  ),
                  color: secondaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
