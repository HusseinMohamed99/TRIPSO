part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildStyledText extends StatelessWidget {
  const BuildStyledText({super.key, required this.text, required this.color});
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.headlineLarge!.copyWith(
          color: color,
          fontSize: getResponsiveFontSize(context, fontSize: 40.sp)),
    ).onlyPadding(bottomPadding: 20);
  }
}
