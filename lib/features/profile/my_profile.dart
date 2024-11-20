import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/styles/theme.dart';
import 'package:tripso/features/password/update_password_screen.dart';
import 'package:tripso/features/profile/edit_profile.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/log_out.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});
  static const String routeName = 'MyProfile';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tripsoCubit = TripsoCubit.get(context).userModel;
        var cubit = TripsoCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20).r,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        maxRadius: 73.r,
                        minRadius: 73.r,
                        child: CircleAvatar(
                          maxRadius: 70.r,
                          minRadius: 70.r,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(75).r,
                            child: CachedNetworkImage(
                              imageUrl: tripsoCubit!.image!,
                              fit: BoxFit.fill,
                              height: 200.h,
                              width: double.infinity,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: AdaptiveIndicator(
                                  os: getOs(),
                                ),
                              ),
                              errorWidget: (context, url, error) => Center(
                                child: AdaptiveIndicator(
                                  os: getOs(),
                                ),
                              ),
                            ),
                          ),
                          // backgroundImage: NetworkImage(tripsoCubit!.image),
                        ),
                      ),
                      Space(height: 15.h, width: 0.w),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            tripsoCubit.firstName + tripsoCubit.lastName,
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              color: ThemeApp.blackPrimary,
                            ),
                          ),
                          Space(
                            height: 5.h,
                            width: 0.w,
                          ),
                          Text(
                            tripsoCubit.email,
                            style: GoogleFonts.roboto(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Space(
                  height: 20.h,
                  width: 0.w,
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15).r),
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      navigateTo(context, routeName: EditProfile.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 22.r,
                            backgroundColor:
                                const Color.fromRGBO(105, 155, 247, 0.15),
                            child: Icon(
                              Icons.edit_outlined,
                              size: 26.sp,
                              color: const Color(0xff699BF7),
                            ),
                          ),
                          Space(
                            width: 35.w,
                            height: 0.h,
                          ),
                          Text(
                            'Custom Profile',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Space(
                  width: 0.w,
                  height: 20.h,
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15).r),
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      navigateTo(context, routeName: UpdatePassword.routeName);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 22.r,
                            backgroundColor:
                                const Color.fromRGBO(255, 153, 0, 0.1),
                            child: Icon(
                              Icons.vpn_key_outlined,
                              size: 26.sp,
                              color: Colors.amber,
                            ),
                          ),
                          Space(
                            width: 35.w,
                            height: 0.h,
                          ),
                          Text(
                            'Change Password',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Space(
                  width: 0.w,
                  height: 20.h,
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15).r),
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      MyDialog.showMessage(
                        context,
                        'Are you sure Delete account?',
                        posActionTitle: 'Yes',
                        posAction: () {
                          {
                            MyDialog.showLoadingDialog(context, 'Loading');
                            cubit.deleteAccount(context);
                            MyDialog.showLoadingDialog(context, 'Loading');
                            MyDialog.hideDialog(context);
                            cubit.currentIndex = 0;
                          }
                          MyDialog.hideDialog(context);
                        },
                        negActionTitle: 'Cancel',
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 22.r,
                            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.1),
                            child: Icon(
                              Icons.delete_forever,
                              size: 26.sp,
                              color: ThemeApp.blackPrimary,
                            ),
                          ),
                          Space(
                            width: 35.w,
                            height: 0.h,
                          ),
                          Text(
                            'Delete account',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                              color: Colors.black45,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Space(
                  width: 0.w,
                  height: 20.h,
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15).r),
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      MyDialog.showMessage(
                        context,
                        'Are you sure logOut?',
                        posActionTitle: 'Yes',
                        posAction: () {
                          {
                            MyDialog.showLoadingDialog(context, 'Loading');
                            logOut(context);
                            cubit.currentIndex = 0;
                            MyDialog.showLoadingDialog(context, 'Loading');
                            MyDialog.hideDialog(context);
                            cubit.currentIndex = 0;
                          }
                          MyDialog.hideDialog(context);
                        },
                        negActionTitle: 'Cancel',
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10).r,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 22.r,
                            backgroundColor:
                                const Color.fromRGBO(247, 21, 21, 0.1),
                            child: Icon(
                              Icons.logout,
                              size: 26.sp,
                              color: Colors.red,
                            ),
                          ),
                          Space(
                            width: 35.w,
                            height: 0.h,
                          ),
                          Text(
                            'Log out',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Space(
                  width: 0.w,
                  height: 20.h,
                ),
                Text(
                  'Created by TEAM ①',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.sp,
                    color: Colors.black45,
                  ),
                ),
                Space(
                  width: 0.w,
                  height: 10.h,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
