part of './../export_manager/export_manager.dart';

AppBar customAppBar({required String title, required BuildContext context}) {
  return AppBar(
    backgroundColor: ColorsManager.primaryColor,
    leading: IconButton(
      icon: Icon(
        size: 24.sp,
        Icons.arrow_back_ios,
        color: ColorsManager.whiteColor,
      ),
      onPressed: () {
        context.pop();
      },
    ),
    title: Text(
      title,
      style: context.titleMedium?.copyWith(
        fontWeight: FontWeightHelper.semiBold,
        color: ColorsManager.whiteColor,
      ),
    ),
    centerTitle: true,
  );
}
