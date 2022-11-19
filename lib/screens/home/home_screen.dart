import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/components/buttons.dart';

import '../../shared/components/app_bar.dart';
import '../../shared/components/log_out.dart';
import '../../shared/styles/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: secondAppBar(),
      body: Center(
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
            defaultMaterialButton(function: ()
            {
              logOut(context);
            }, text: 'logOut',  color: primaryColor,)
          ],
        ),
      ),
    );
  }
}
