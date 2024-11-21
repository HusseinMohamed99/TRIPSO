part of './../../core/helpers/export_manager/export_manager.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({super.key, required this.sharedPrefHelper});

  final SharedPrefHelper sharedPrefHelper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondaryAppBar(),
      backgroundColor: Colors.transparent,
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.onBoardImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w), // Responsive padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: _buildWelcomeText()),
              _buildActionButtons(context),
              Space(height: 20, width: 0), // Adjusted for better spacing
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeText() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildStyledText('BE\nREADY', ColorsManager.whiteColor),
          Row(
            children: [
              _buildStyledText('TO', ColorsManager.whiteColor),
              _buildStyledText('UR', ColorsManager.primaryColor),
            ],
          ),
          _buildStyledText('NEXT', ColorsManager.primaryColor),
          _buildStyledText('ADVENTURE', ColorsManager.whiteColor),
        ],
      );

  Widget _buildStyledText(String text, Color color) => Text(
        text,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(
            color: color,
            fontSize: 40.sp, // Adjusted for better readability
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  Widget _buildActionButtons(BuildContext context) => Column(
        children: [
          defaultMaterialButton(
            function: () => _navigateTo(context, Routes.signInScreen),
            text: 'Sign in',
            color: ColorsManager.primaryColor,
          ),
          Space(height: 20, width: 0), // Adjusted for better spacing
          defaultMaterialButton(
            function: () => _navigateTo(context, Routes.signUpScreen),
            text: 'Sign up',
            color: ColorsManager.primaryColor.withOpacity(0.30),
          ),
        ],
      );

  void _navigateTo(BuildContext context, String route) {
    try {
      sharedPrefHelper.setOnBoardingScreenViewed();
      context.pushReplacementNamed(route);
    } catch (error) {
      debugPrint('Error navigating to $route: $error');
      // Optionally, show a Snackbar or Error Dialog here
    }
  }
}
