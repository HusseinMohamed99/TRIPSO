import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/styles/colors.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);
  static const String routeName = 'WishList';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'WishList',
        style: GoogleFonts.roboto(
          fontSize: 40,
          fontWeight: FontWeight.w500,
          color: primaryColor,
        ),
      ),
    );
  }
}
