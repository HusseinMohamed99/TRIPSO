part of './../export_manager/export_manager.dart';

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
