part of './../../core/helpers/export_manager/export_manager.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key, required this.sharedPrefHelper});

  final SharedPrefHelper sharedPrefHelper;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: ColorsManager.blackPrimary,
      ),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.onBoardImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.w), // Responsive padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: BuildWelcomeText()),
                BuildActionButtons(sharedPrefHelper: sharedPrefHelper),
                Space(height: 20, width: 0), // Adjusted for better spacing
              ],
            ),
          ),
        ),
      ),
    );
  }
}
