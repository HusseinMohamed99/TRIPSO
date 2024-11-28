part of '../../../core/helpers/export_manager/export_manager.dart';

// Function to generate a list of icons based on the rating
List<Icon> generateRatingIcons(int rating, {Color? color}) {
  List<Icon> icons = [];
  for (int i = 0; i < 5; i++) {
    if (i < rating) {
      icons.add(Icon(
        Icons.star,
        color: color ?? ColorsManager.yellowColor,
        size: 20.sp,
      ));
    } else if (i == rating) {
      icons.add(Icon(
        Icons.star_half_outlined,
        color: color ?? ColorsManager.yellowColor,
        size: 20.sp,
      ));
    } else {
      icons.add(Icon(
        Icons.star_border,
        color: color ?? ColorsManager.whiteColor,
        size: 20.sp,
      ));
    }
  }
  return icons;
}

class GridItemSights extends StatelessWidget {
  const GridItemSights(
    this.cityModel, {
    super.key,
    required this.placeModel,
  });

  final PlaceModel placeModel;
  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    int rating = (double.tryParse(placeModel.rate) ?? 0)
        .toInt(); // Parse rating from string to int
    return InkWell(
      borderRadius: BorderRadius.circular(20).r,
      onTap: () {
        // navigateTo(
        //   context,
        //   routeName: SightDetailsScreen.routeName,
        //   arguments: ScreenArgs(
        //       placeModel: placeModel,
        //       cityModel: cityModel),
        // );
        // if (kDebugMode) {
        //   print(placeModel.pId);
        // }
      },
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Card(
            elevation: 2,
            color: ColorsManager.whiteColor,
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
                          child: AdaptiveIndicator(),
                        ),
                        errorWidget: (context, url, error) => Icon(
                          Icons.info,
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
                                      color: ColorsManager.whiteColor,
                                    ),
                          ),
                          Row(
                            children: generateRatingIcons(rating),
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
                                      color: ColorsManager.whiteColor,
                                    ),
                              ),
                              Space(height: 0.h, width: 10.w),
                              Icon(
                                Icons.location_on_outlined,
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
