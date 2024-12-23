part of './../export_manager/export_manager.dart';

// Helper function to build the rating row with stars
Widget buildRatingRow(double rating) {
  return Row(
    children: generateRatingIcons(rating),
  );
}
