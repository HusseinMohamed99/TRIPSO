part of './../export_manager/export_manager.dart';

extension SkeletonizerExtension on Widget {
  Widget skeletonize({bool enabled = true}) {
    return Skeletonizer(
      effect: ShimmerEffect(
        baseColor: ColorsManager.blackPrimary, // Adjust colors as needed
        highlightColor: ColorsManager.blackPrimary.withOpacity(0.5),
        duration: const Duration(seconds: 1),
      ),
      switchAnimationConfig: SwitchAnimationConfig(
        duration: Duration(milliseconds: 800),
        reverseDuration: Duration(milliseconds: 800),
      ),
      enabled: enabled,
      enableSwitchAnimation: true,
      child: this,
    );
  }
}
