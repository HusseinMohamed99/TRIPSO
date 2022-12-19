import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/styles/colors.dart';

class AllPlansScreen extends StatelessWidget {
  const AllPlansScreen({Key? key}) : super(key: key);
  static const String routeName = 'AllPlansScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'All Plans Screen',
          style: GoogleFonts.roboto(
            fontSize: 40,
            fontWeight: FontWeight.w500,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
