import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/mobile/screens/sign_in/sign_in_screen.dart';
import 'package:tripso/mobile/screens/sign_up/sign_up_screen.dart';
import 'package:tripso/shared/animation/fade_animation.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/scrollable_form.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/colors.dart';

class OnBoard extends StatelessWidget {
  static const String routeName = 'onBoard_screen';

  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetPath.onBoardImage),
          fit: BoxFit.fill,
        ),
      ),
      child: FadeAnimation(
        1.3,
        child: Scaffold(
          appBar: secondaryAppBar(),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50.0),
            child: Center(
              child: CustomScrollableForm(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    welcomeText(),
                    button(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget welcomeText() => Expanded(
    flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Text(
                'BE\nREADY',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: secondaryColor,
                    fontSize: 45,
                    height: 1.3,
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
                  textStyle: const TextStyle(
                    height: 1.3,
                        color: secondaryColor,
                        fontSize: 45,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
            ),
            FittedBox(
              child: Text(
                'UR',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    height: 1.3,
                    color: Color(0xff60D0E6),
                    fontSize: 45,
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
              textStyle: const TextStyle(
                height: 1.3,
                color: Color(0xff60D0E6),
                fontSize: 45,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        FittedBox(
          child: Text(
            'ADVENTURE',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                height: 1.3,
                    color: secondaryColor,
                    fontSize: 45,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ],
    ),
      );

  Widget button(context) => Expanded(
    flex: 1,
        child: Column(
          children: [
            defaultMaterialButton(
              function: () {
                navigateAndFinish(context, routeName: SignInScreen.routeName);
              },
              text: 'Sign in',
              color: primaryColor,
            ),
            const Space(width: 0, height: 26),
            defaultMaterialButton(
              function: () {
                navigateTo(context, routeName: SignUpScreen.routeName);
              },
              text: 'Sign up',
              color: primaryColor.withOpacity(0.30),
            ),
            //  space(0, 50),
          ],
    ),
      );
}
