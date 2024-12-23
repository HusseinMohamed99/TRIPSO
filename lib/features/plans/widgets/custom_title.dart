part of './../../../core/helpers/export_manager/export_manager.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    this.color,
    this.textStyle,
    required this.title,
    this.maxLines,
    this.overflow,
  });
  final Color? color;
  final String title;
  final TextStyle? textStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLines,
      overflow: overflow,
      style: textStyle ??
          context.labelLarge?.copyWith(
            color: color ?? ColorsManager.blackPrimary,
          ),
    );
  }
}
