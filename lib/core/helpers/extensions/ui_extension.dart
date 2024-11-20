part of './../export_manager/export_manager.dart';

extension UIExtensions on num {
  /// Padding
  EdgeInsets get allPadding => EdgeInsets.all(toDouble().r);
  EdgeInsets get vPadding => EdgeInsets.symmetric(vertical: toDouble().h);
  EdgeInsets get hPadding => EdgeInsets.symmetric(horizontal: toDouble().w);

  /// Margin
  EdgeInsets get allMargin => EdgeInsets.all(toDouble().r);
  EdgeInsets get vMargin => EdgeInsets.symmetric(vertical: toDouble().h);
  EdgeInsets get hMargin => EdgeInsets.symmetric(horizontal: toDouble().w);

  /// BorderRadius
  BorderRadius get allBorderRadius => BorderRadius.circular(toDouble().r);
  BorderRadius get topBorderRadius =>
      BorderRadius.vertical(top: Radius.circular(toDouble().r));
  BorderRadius get bottomBorderRadius =>
      BorderRadius.vertical(bottom: Radius.circular(toDouble().r));

  /// Dividers
  Widget get verticalDivider =>
      VerticalDivider(width: toDouble().w, thickness: 1);
  Widget get horizontalDivider => Divider(height: toDouble().h, thickness: 1);

  /// SizedBox
  Widget get verticalSizedBox => SizedBox(height: toDouble().h);
  Widget get horizontalSizedBox => SizedBox(width: toDouble().w);
}
