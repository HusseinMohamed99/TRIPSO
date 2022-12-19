import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/styles/colors.dart';

class SightsScreen extends StatelessWidget {
  const SightsScreen({Key? key}) : super(key: key);
  static const String routeName = 'SightsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Sights Screen',
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
