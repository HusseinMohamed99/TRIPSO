part of './../export_manager/export_manager.dart';

extension SnackBarExtension on BuildContext {
  void showSnackBar(String message, {Color? color}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: labelLarge!.copyWith(
            color: color ?? ColorsManager.greenColor,
          ),
        ),
      ),
    );
  }
}

onTap(BuildContext context) {
  // You Can Use
  context.showSnackBar('Tapped');

  // Instead Of
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        'Tapped',
        style: context.labelLarge,
      ),
    ),
  );
}
