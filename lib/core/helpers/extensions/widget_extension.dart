part of './../export_manager/export_manager.dart';

extension WidgetExtension on Widget {
  // Padding
  Widget allPadding(double padding) =>
      Padding(padding: EdgeInsets.all(padding), child: this);
  Widget vPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(vertical: padding), child: this);

  Widget hPadding(double padding) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: padding), child: this);

  Widget onlyPadding({
    double topPadding = 0,
    bottomPadding = 0,
    leftPadding = 0,
    rightPadding = 0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          top: topPadding.h,
          bottom: bottomPadding.h,
          left: leftPadding.w,
          right: rightPadding.w,
        ),
        child: this,
      );

  // Center Widget
  Widget center() => Center(child: this);

  // Warp the Widget with ClipRRect
  Widget clipRRect({BorderRadius borderRadius = BorderRadius.zero}) =>
      ClipRRect(
        borderRadius: borderRadius,
        child: this,
      );
}
