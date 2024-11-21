part of './../../../core/helpers/export_manager/export_manager.dart';

class BuildActionButtons extends StatelessWidget {
  const BuildActionButtons({super.key, required this.sharedPrefHelper});
  final SharedPrefHelper sharedPrefHelper;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        defaultMaterialButton(
          function: () =>
              _navigateTo(context, Routes.signInScreen, sharedPrefHelper),
          text: 'Sign in',
          color: ColorsManager.primaryColor,
        ),
        Space(height: 20, width: 0), // Adjusted for better spacing
        defaultMaterialButton(
          function: () =>
              _navigateTo(context, Routes.signUpScreen, sharedPrefHelper),
          text: 'Sign up',
          color: ColorsManager.primaryColor.withOpacity(0.30),
        ),
      ],
    );
  }
}
