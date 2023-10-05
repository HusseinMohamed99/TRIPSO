import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/mobile/screens/sign_in/sign_in_screen.dart';
import 'package:tripso/mobile/screens/sign_up/sign_up_screen.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/theme.dart';

class OnBoard extends StatelessWidget {
  static const String routeName = 'onBoard_screen';

  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.onBoardImage),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        appBar: secondaryAppBar(),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.0.r),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: welcomeText(),
                ),
                button(context),
                Space(height: 50.h, width: 0.w),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget welcomeText() => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Text(
              'BE\nREADY',
              style: GoogleFonts.roboto(
                textStyle: TextStyle(
                  height: 1.h,
                  color: ThemeApp.secondaryColor,
                  fontSize: 45.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Row(
            children: [
              FittedBox(
                child: Text(
                  'TO',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      height: 1.h,
                      color: ThemeApp.secondaryColor,
                      fontSize: 45.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  'UR',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      height: 1.h,
                      color: ThemeApp.primaryColor,
                      fontSize: 45.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          FittedBox(
            child: Text(
              'NEXT',
              style: GoogleFonts.roboto(
                height: 1.h,
                textStyle: TextStyle(
                  color: ThemeApp.primaryColor,
                  fontSize: 45.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          FittedBox(
            child: Text(
              'ADVENTURE',
              style: GoogleFonts.roboto(
                height: 1.h,
                textStyle: TextStyle(
                  color: ThemeApp.secondaryColor,
                  fontSize: 45.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      );

  Widget button(context) => Column(
        children: [
          defaultMaterialButton(
            function: () {
              navigateAndFinish(context, routeName: SignInScreen.routeName);
            },
            text: 'Sign in',
            color: ThemeApp.primaryColor,
          ),
          Space(width: 0.w, height: 26.h),
          defaultMaterialButton(
            function: () {
              navigateTo(context, routeName: SignUpScreen.routeName);
            },
            text: 'Sign up',
            color: ThemeApp.primaryColor.withOpacity(0.30),
          ),
          //  space(0, 50),
        ],
      );
}
