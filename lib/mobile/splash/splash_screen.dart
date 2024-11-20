import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:tripso/mobile/home/home_screen.dart';
import 'package:tripso/mobile/on_boarding/on_boarding_screen.dart';
import 'package:tripso/shared/components/size_config.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/network/cache_helper.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/theme.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash_screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ThemeApp.secondaryColor,
      body: SplashScreenBody(),
    );
  }
}

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  late StreamSubscription<ConnectivityResult> subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    _initializeConnectivity();
    _navigateToNextScreen();
  }

  @override
  void dispose() {
    _subscription!.cancel();
    super.dispose();
  }

  StreamSubscription<List<ConnectivityResult>>? _subscription;

  void _initializeConnectivity() {
    _subscription = Connectivity().onConnectivityChanged.listen(
      (List<ConnectivityResult> result) {
        _handleConnectivityChange(result.first);
      },
    );
  }

  Future<void> _handleConnectivityChange(ConnectivityResult result) async {
    bool isDeviceConnected = await InternetConnectionChecker().hasConnection;

    if (!isDeviceConnected && !isAlertSet) {
      _showNoConnectionDialog();
      setState(() => isAlertSet = true);
    } else if (isDeviceConnected && isAlertSet) {
      Navigator.pop(context); // Close dialog when connected
      setState(() => isAlertSet = false);
    }
  }

  void _navigateToNextScreen() {
    Timer(const Duration(seconds: 3), () {
      uId = CacheHelper.getData(key: 'uId');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => uId != null ? const CitiesScreen() : const OnBoard(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.splashImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: AnimatedSplashScreen(
          splashIconSize: 200,
          backgroundColor: Colors.transparent,
          pageTransitionType: PageTransitionType.rightToLeft,
          splashTransition: SplashTransition.scaleTransition,
          splash: AssetPath.logoImage,
          nextScreen:
              const SizedBox(), // Placeholder; actual navigation handled in Timer
          duration: 2000,
          animationDuration: const Duration(seconds: 2),
        ),
      ),
    );
  }

  void _showNoConnectionDialog() {
    showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('No Connection'),
        content: const Text('Please check your internet connectivity'),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              Navigator.pop(context, 'Cancel');
              setState(() => isAlertSet = false);
              isDeviceConnected =
                  await InternetConnectionChecker().hasConnection;
              if (!isDeviceConnected && !isAlertSet) {
                _showNoConnectionDialog();
                setState(() => isAlertSet = true);
              }
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
