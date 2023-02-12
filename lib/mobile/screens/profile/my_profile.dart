import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/mobile/screens/password/update_password_screen.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/components/log_out.dart';
import 'package:tripso/shared/components/my_divider.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      maxRadius: 70.r,
                      minRadius: 70.r,
                      backgroundImage: AssetImage(tripsoCubit!.image),
                    ),
                    Space(height: 0.h, width: 30),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tripsoCubit.firstName + tripsoCubit.lastName,
                          style: GoogleFonts.roboto(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Space(height: 5.h, width: 0.w),
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
                Space(height: 20.h, width: 0.w),
                InkWell(
                  onTap: () {
                    if (kDebugMode) {
                      print('Custom Profile');
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(105, 155, 247, 0.15),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(19).r),
                          ),
                          child: CircleAvatar(
                            radius: 22.r,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.edit_outlined,
                              size: 28.sp,
                              color: const Color(0xff699BF7),
                            ),
                          ),
                        ),
                        Space(height: 0.h, width: 35.w),
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
                const MyDivider(),
                InkWell(
                  onTap: () {
                    navigateTo(context, routeName: UpdatePassword.routeName);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 153, 0, 0.1),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(19).r),
                          ),
                          child: CircleAvatar(
                            radius: 22.r,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.vpn_key_outlined,
                              size: 28.sp,
                              color: Colors.amber,
                            ),
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
                const MyDivider(),
                InkWell(
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
                        }
                        MyDialog.hideDialog(context);
                      },
                      negActionTitle: 'Cancel',
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(19).r),
                          ),
                          child: CircleAvatar(
                            radius: 22.r,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.delete_forever,
                              size: 28.sp,
                              color: Colors.black,
                            ),
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
                const MyDivider(),
                InkWell(
                  onTap: () {
                    MyDialog.showMessage(
                      context,
                      'Are you sure logOut?',
                      posActionTitle: 'Yes',
                      posAction: () {
                        {
                          MyDialog.showLoadingDialog(context, 'Loading');
                          logOut(context);
                          MyDialog.showLoadingDialog(context, 'Loading');
                          MyDialog.hideDialog(context);
                        }
                        MyDialog.hideDialog(context);
                      },
                      negActionTitle: 'Cancel',
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20).r,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 60.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(247, 21, 21, 0.1),
                            borderRadius:
                                BorderRadius.all(const Radius.circular(19).r),
                          ),
                          child: CircleAvatar(
                            radius: 22.r,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.logout,
                              size: 28.sp,
                              color: Colors.red,
                            ),
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
              ],
            ),
          ),
        );
      },
    );
  }
}