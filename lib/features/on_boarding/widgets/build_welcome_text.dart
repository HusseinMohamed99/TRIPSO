part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildWelcomeText extends StatelessWidget {
  const BuildWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BuildStyledText(text: 'BE', color: ColorsManager.whiteColor),
        BuildStyledText(text: 'READY', color: ColorsManager.whiteColor),
        Row(
          children: [
            BuildStyledText(text: 'TO', color: ColorsManager.whiteColor)
                .onlyPadding(rightPadding: 10),
            BuildStyledText(text: 'UR', color: ColorsManager.primaryColor),
          ],
        ),
        BuildStyledText(text: 'NEXT', color: ColorsManager.primaryColor),
        BuildStyledText(text: 'ADVENTURE', color: ColorsManager.whiteColor),
      ],
    );
  }
}
