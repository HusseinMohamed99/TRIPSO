part of './../../../core/helpers/export_manager/export_manager.dart';

class CityAndCountryTitle extends StatelessWidget {
  const CityAndCountryTitle({
    super.key,
    required this.cityTitle,
    required this.countryTitle,
  });

  final String cityTitle, countryTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cityTitle.trim(),
          style: context.headlineSmall?.copyWith(
            color: ColorsManager.whiteColor,
          ),
        ),
        Space(height: 10, width: 0),
        Row(
          children: [
            Icon(
              Icons.location_on,
              color: ColorsManager.primaryColor,
              size: 30.sp,
            ),
            Text(
              countryTitle.trim(),
              style: context.titleLarge?.copyWith(
                color: ColorsManager.whiteColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
