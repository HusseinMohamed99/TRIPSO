part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildFeatureTitleForDestination extends StatelessWidget {
  const BuildFeatureTitleForDestination({
    super.key,
    required this.onTap,
    required this.icon,
    required this.iconColor,
    required this.backgroundColor,
    required this.label,
  });
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor, backgroundColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    backgroundColor.withOpacity(0.8),
                    backgroundColor.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor.withOpacity(0.3),
                    offset: Offset(0, 4),
                    blurRadius: 10.r,
                  ),
                ],
                borderRadius: BorderRadius.circular(20).r,
              ),
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                  size: 32.sp,
                  color: iconColor,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: context.titleSmall?.copyWith(
                fontWeight: FontWeightHelper.semiBold,
                color: ColorsManager.blackPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
