part of './../../../core/helpers/export_manager/export_manager.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    this.color,
    this.textStyle,
    required this.title,
  });
  final Color? color;
  final String title;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: textStyle ??
          context.labelLarge?.copyWith(
            color: color ?? ColorsManager.blackPrimary,
          ),
    );
  }
}
