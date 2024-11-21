part of './../helpers/export_manager/export_manager.dart';

class AppRouters {
  Route? generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onBoardingView:
        return MaterialPageRoute(
          builder: (_) => const OnBoard(),
        );
    }
    return null;
  }
}
