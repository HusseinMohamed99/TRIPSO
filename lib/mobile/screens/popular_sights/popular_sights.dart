import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/styles/colors.dart';

class PopularSightsScreen extends StatelessWidget {
  const PopularSightsScreen({Key? key}) : super(key: key);
  static const String routeName = 'PopularSightsScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Popular Sights Screen',
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
