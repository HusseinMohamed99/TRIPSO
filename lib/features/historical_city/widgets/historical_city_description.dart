part of './../../../core/helpers/export_manager/export_manager.dart';

class HistoricalCityDescription extends StatelessWidget {
  const HistoricalCityDescription({super.key, required this.historical});
  final String historical;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          top: 5.h,
          left: 20.w,
          right: 20.w,
        ),
        height: 300.h,
        decoration: BoxDecoration(
            color: ColorsManager.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(40).r,
              topRight: const Radius.circular(40).r,
            )),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Description',
                  style: context.headlineSmall?.copyWith(
                    color: ColorsManager.blackPrimary,
                    decoration: TextDecoration.underline,
                  ),
                ).onlyPadding(
                  topPadding: 10,
                  bottomPadding: 10,
                ),
                Text(
                  historical,
                  style: context.titleMedium?.copyWith(
                    color: ColorsManager.blackPrimary,
                    fontWeight: FontWeightHelper.thin,
                  ),
                ).onlyPadding(
                  bottomPadding: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
