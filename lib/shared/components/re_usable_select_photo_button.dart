import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/shared/components/sized_box.dart';

class SelectPhoto extends StatelessWidget {
  final String textLabel;
  final IconData icon;

  final void Function()? onTap;

  const SelectPhoto({
    super.key,
    required this.textLabel,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 10,
        backgroundColor: Colors.grey.shade200,
        shape: const StadiumBorder(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 6,
        ).r,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: ColorsManager.blackPrimary,
            ),
            Space(height: 0.h, width: 14.w),
            Text(
              textLabel,
              style: GoogleFonts.roboto(
                fontSize: 18.sp,
                color: ColorsManager.blackPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}
