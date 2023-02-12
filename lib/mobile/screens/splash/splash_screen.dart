import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tripso/mobile/screens/home/home_screen.dart';
import 'package:tripso/mobile/screens/on_boarding/on_boarding_screen.dart';
import 'package:tripso/shared/components/size_config.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/network/cache_helper.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/colors.dart';
import 'package:tripso/shared/styles/theme.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: secondaryColor,
      body: SplashScreenBody(),
    );
  }
}

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({Key? key}) : super(key: key);

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;

  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );

  @override
  void initState() {
    getConnectivity();
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    fadingAnimation =
        Tween<double>(begin: 0.1, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);
    Timer(const Duration(seconds: 3), () {
      uId = CacheHelper.getData(key: 'uId');
      if (uId != null) {
        Navigator.pushReplacementNamed(context, CitiesScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoard.routeName);
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.splashImage),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        //appBar: primaryAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: fadingAnimation!,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TRI',
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        color: ThemeApp.primaryColor,
                        fontSize: 45.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    'PSO',
                    style: GoogleFonts.pacifico(
                      textStyle: TextStyle(
                        color: ThemeApp.secondaryColor,
                        fontSize: 45.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDialogBox() => showCupertinoDialog<String>(
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
                if (!isDeviceConnected && isAlertSet == false) {
                  showDialogBox();
                  setState(() => isAlertSet = true);
                }
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
}
