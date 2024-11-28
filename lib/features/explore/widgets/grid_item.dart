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
    // Parse rating from string to int
    int rating = (double.tryParse(placeModel.rate) ?? 0).toInt();

    return InkWell(
      borderRadius: BorderRadius.circular(20).r,
      onTap: () {
        // Navigate to the place details page
        // navigateTo(
        //   context,
        //   routeName: SightDetailsScreen.routeName,
        //   arguments: ScreenArgs(
        //       placeModel: placeModel,
        //       cityModel: cityModel),
        // );
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
                    _buildImage(placeModel.image),
                    _buildOverlay(),
                    _buildPlaceInfo(context, rating),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to build the image with a loading indicator and error widget
  Widget _buildImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12).r,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        height: 220.h,
        width: double.infinity,
        progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: AdaptiveIndicator(),
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.info,
          size: 24.sp,
        ),
      ),
    );
  }

  // Helper function to build the overlay layer
  Widget _buildOverlay() {
    return LayerImage(
      height: 220.h,
      width: double.infinity,
      borderRadius: BorderRadius.circular(12).r,
    );
  }

  // Helper function to build the place information text and rating row
  Widget _buildPlaceInfo(BuildContext context, int rating) {
    return Padding(
      padding: const EdgeInsets.all(10.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPlaceName(context),
          _buildRatingRow(rating),
          _buildLocationRow(context),
        ],
      ),
    );
  }

  // Helper function to build the place name text
  Widget _buildPlaceName(BuildContext context) {
    return Text(
      placeModel.name.trim(),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: context.labelLarge?.copyWith(
        color: ColorsManager.whiteColor,
      ),
    );
  }

  // Helper function to build the rating row with stars
  Widget _buildRatingRow(int rating) {
    return Row(
      children: generateRatingIcons(rating),
    );
  }

  // Helper function to build the location row with country and icon
  Widget _buildLocationRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          TripsoCubit.get(context).cityModel!.country,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
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
    );
  }
}
