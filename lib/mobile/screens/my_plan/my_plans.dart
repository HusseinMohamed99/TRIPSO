import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/styles/colors.dart';

class MyPlansScreen extends StatelessWidget {
  const MyPlansScreen({Key? key}) : super(key: key);
  static const String routeName = 'MyPlans';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'MyPlans',
        style: GoogleFonts.roboto(
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
      ),
    );
  }
}
