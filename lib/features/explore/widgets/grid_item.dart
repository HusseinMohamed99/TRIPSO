part of '../../../core/helpers/export_manager/export_manager.dart';

// Function to generate a list of icons based on the rating
List<Icon> generateRatingIcons(double rating, {Color? color}) {
  List<Icon> icons = [];

  // Iterate up to 5 stars
  for (int i = 1; i <= 5; i++) {
    if (rating >= i) {
      // Full star if the rating is greater than or equal to the star index
      icons.add(Icon(
        Icons.star,
        color: color ?? ColorsManager.yellowColor,
        size: 16.sp,
      ));
    } else if (rating >= i - 0.5) {
      // Half star if the rating is greater than or equal to half of this star
      icons.add(Icon(
        Icons.star_half_outlined,
        color: color ?? ColorsManager.yellowColor,
        size: 16.sp,
      ));
    } else {
      // Empty star if the rating is less than the current star index
      icons.add(Icon(
        Icons.star_border,
        color: color ?? ColorsManager.whiteColor,
        size: 16.sp,
      ));
    }
  }

  return icons;
}

class GridItemSights extends StatelessWidget {
  const GridItemSights({
    super.key,
    required this.placeModel,
  });

  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    // Parse rating from string to int
    double rating = (double.tryParse(placeModel.rate) ?? 0).toDouble();

    return GestureDetector(
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
        fit: BoxFit.fitHeight,
        height: 220.h,
        width: double.infinity,
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
  Widget _buildPlaceInfo(BuildContext context, double rating) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildPlaceName(context),
        _buildRatingRow(rating),
        _buildLocationRow(context),
      ],
    ).allPadding(
      hPadding: 10,
      vPadding: 10,
    ); // Using direct padding
  }

  // Helper function to build the place name text
  Widget _buildPlaceName(BuildContext context) {
    return Text(
      placeModel.name.trim(),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: context.titleSmall?.copyWith(
        color: ColorsManager.whiteColor,
        fontWeight:
            FontWeightHelper.semiBold, // Ensure FontWeightHelper is defined
      ),
    );
  }

  // Helper function to build the rating row with stars
  Widget _buildRatingRow(double rating) {
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
          context.read<TripsoCubit>().cityModel?.country ??
              '', // Ensure TripsoCubit is correctly provided
          style: context.titleSmall?.copyWith(
            color: ColorsManager.whiteColor,
            fontWeight:
                FontWeightHelper.semiBold, // Ensure FontWeightHelper is defined
          ),
        ),
        Space(height: 0, width: 10),
        Icon(
          Icons.location_on_outlined,
          color: ColorsManager.primaryColor,
          size: 24.sp,
        ),
      ],
    );
  }
}
