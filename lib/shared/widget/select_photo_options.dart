import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/shared/components/re_usable_select_photo_button.dart';
import 'package:tripso/shared/components/sized_box.dart';

class SelectPhotoOptions extends StatelessWidget {
  const SelectPhotoOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20).r,
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -30.h,
            child: Container(
              width: 50.w,
              height: 6.h,
              margin: const EdgeInsets.only(bottom: 20).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5).r,
                color: ColorsManager.whiteColor,
              ),
            ),
          ),
          Space(height: 20.h, width: 0.w),
          Column(children: [
            SelectPhoto(
              onTap: () {
                TripsoCubit.get(context).getProfileImage(ImageSource.gallery);
              },
              icon: Icons.image,
              textLabel: 'Browse Gallery',
            ),
            Space(height: 10.h, width: 0.w),
            Center(
              child: Text(
                'OR',
                style: GoogleFonts.roboto(fontSize: 18.sp),
              ),
            ),
            Space(height: 10.h, width: 0.w),
            SelectPhoto(
              onTap: () {
                TripsoCubit.get(context).getProfileImage(ImageSource.camera);
              },
              icon: Icons.camera_alt_outlined,
              textLabel: 'Use a Camera',
            ),
          ])
        ],
      ),
    );
  }
}
