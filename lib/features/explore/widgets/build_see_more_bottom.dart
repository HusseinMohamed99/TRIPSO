part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildSeeMoreBottom extends StatelessWidget {
  const BuildSeeMoreBottom({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Handle the tap event to navigate to the Popular Sights screen
      // navigateTo(context, routeName: PopularSightsScreen.routeName, arguments: ...);
      onTap: onTap,
      child: Row(
        children: [
          Text(
            'See More',
            style: context.labelLarge
                ?.copyWith(fontWeight: FontWeightHelper.semiBold),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 24.sp,
            color: ColorsManager.primaryColor,
          ),
        ],
      ),
    );
  }
}
