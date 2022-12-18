import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/layout/layout.dart';
import 'package:tripso/shared/animation/fade_animation.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/log_out.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FadeAnimation(
        1.5,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HOME Screen',
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 45,
                    height: 1.3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              defaultMaterialButton(
                function: () {
                  logOut(context);
                },
                text: 'logOut',
                color: primaryColor,
              ),
              defaultMaterialButton(
                function: () {
                  navigateTo(context, routeName: HomeLayout.routeName);
                },
                text: 'Layout',
                color: primaryColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
