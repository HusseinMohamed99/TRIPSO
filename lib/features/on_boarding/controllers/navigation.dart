part of './../../../core/helpers/export_manager/export_manager.dart';

void _navigateTo(
    BuildContext context, String route, SharedPrefHelper sharedPrefHelper) {
  try {
    sharedPrefHelper.setOnBoardingScreenViewed();
    context.pushReplacementNamed(route);
  } catch (error) {
    debugPrint('Error navigating to $route: $error');
    // Optionally, show a Snackbar or Error Dialog here
  }
}
