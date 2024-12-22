part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildTitleSection extends StatelessWidget {
  const BuildTitleSection(
      {super.key, required this.onTap, required this.title});
  final VoidCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.titleMedium?.copyWith(
              fontWeight:
                  FontWeightHelper.semiBold, // Slightly heavier font weight
              color: ColorsManager.blackPrimary,
            ),
          ),
          BuildSeeMoreBottom(
            onTap: () {
              // Handle the tap event to navigate
            },
          ),
        ],
      ),
    );
  }
}
