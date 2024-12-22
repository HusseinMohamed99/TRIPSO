part of './../../../core/helpers/export_manager/export_manager.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: ColorsManager.blackPrimary.withOpacity(0.5),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: const StadiumBorder(
        side: BorderSide(color: ColorsManager.whiteColor),
      ),
      child: IconButton(
        onPressed: () async {
          if (Navigator.canPop(context)) {
            context.pop();
          }
          await flutterTts.pause();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: ColorsManager.whiteColor,
          size: 24.sp,
        ),
      ),
    );
  }
}
