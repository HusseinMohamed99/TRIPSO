import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/widget/select_photo_options.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/text_form_field.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/theme.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  static const String routeName = 'EditProfile';
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tripsoCubit = TripsoCubit.get(context).userModel;

    firstnameController.text = tripsoCubit!.firstName;
    lastnameController.text = tripsoCubit.lastName;
    phoneController.text = tripsoCubit.phone;
    emailController.text = tripsoCubit.email;
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = TripsoCubit.get(context);
        File? profileImage = TripsoCubit.get(context).profileImage;
        return Scaffold(
          appBar: primaryAppBar(
            title: 'Edit Profile',
            function: () {
              pop(context);
            },
            iconData: Icon(
              Icons.arrow_back,
              size: 25.sp,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 0).r,
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 67.r,
                            backgroundColor: ThemeApp.primaryColor,
                            child: CircleAvatar(
                              backgroundColor: ThemeApp.secondaryColor,
                              radius: 65.r,
                              child: CircleAvatar(
                                backgroundImage: profileImage == null
                                    ? NetworkImage(tripsoCubit.image)
                                    : FileImage(profileImage) as ImageProvider,
                                radius: 65.r,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 75.h,
                            left: 90.w,
                            child: CircleAvatar(
                              radius: 22.r,
                              backgroundColor: ThemeApp.primaryColor,
                              child: IconButton(
                                splashRadius: 1,
                                onPressed: () {
                                  showSelectPhotoOptions(context);
                                },
                                icon: Icon(
                                  IconlyLight.image,
                                  color: ThemeApp.secondaryColor,
                                  size: 30.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Space(height: 40.h, width: 0.w),
                      DefaultTextFormField(
                        borderSideColor: ThemeApp.blackPrimary,
                        styleColor: ThemeApp.blackPrimary,
                        prefixColor: ThemeApp.blackPrimary,
                        context: context,
                        controller: firstnameController,
                        keyboardType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Firstname must not be empty !';
                          }
                          return null;
                        },
                        label: 'Firstname',
                        prefix: Icons.account_circle_outlined,
                      ),
                      Space(
                        height: 26.h,
                        width: 0,
                      ),
                      DefaultTextFormField(
                        borderSideColor: ThemeApp.blackPrimary,
                        styleColor: ThemeApp.blackPrimary,
                        prefixColor: ThemeApp.blackPrimary,
                        context: context,
                        controller: lastnameController,
                        keyboardType: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Lastname must not be empty !';
                          }
                          return null;
                        },
                        label: 'Lastname',
                        prefix: Icons.account_circle_outlined,
                      ),
                      Space(
                        height: 26.h,
                        width: 0,
                      ),
                      DefaultTextFormField(
                        borderSideColor: ThemeApp.blackPrimary,
                        styleColor: ThemeApp.blackPrimary,
                        prefixColor: ThemeApp.blackPrimary,
                        context: context,
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'phone must not be empty !';
                          } else if (value.length != 11) {
                            return 'Sorry, your phone must be\n 11 numbers long.';
                          } else {
                            return null;
                          }
                        },
                        label: 'phone number',
                        prefix: Icons.phone,
                      ),
                      Space(
                        height: 26.h,
                        width: 0,
                      ),
                      DefaultTextFormField(
                        borderSideColor: ThemeApp.blackPrimary,
                        styleColor: ThemeApp.blackPrimary,
                        prefixColor: ThemeApp.blackPrimary,
                        context: context,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email is Required';
                          } else if (value.length < 16) {
                            return 'Sorry, your mail must be\n between 16 and 30 characters long.';
                          } else {
                            return null;
                          }
                        },
                        prefix: Icons.alternate_email,
                        label: 'Email Address',
                      ),
                      Space(
                        height: 40.h,
                        width: 0.w,
                      ),
                      defaultButton(
                        color: ThemeApp.primaryColor,
                        function: () {
                          if (cubit.profileImage != null) {
                            cubit.uploadProfileImage(
                              firstName: firstnameController.text,
                              phone: phoneController.text,
                              lastName: lastnameController.text,
                              email: emailController.text,
                            );
                          } else {
                            cubit.updateUserData(
                              firstName: firstnameController.text,
                              lastName: lastnameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                        widget: Text(
                          'Confirm',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontSize: 19.sp,
                            color: ThemeApp.secondaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Space(
                        height: 10.h,
                        width: 0.w,
                      ),
                      if (state is UpdateUserLoadingState)
                        const LinearProgressIndicator(
                          color: ThemeApp.primaryColor,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: const Radius.circular(25.0).r,
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.3.spMax,
          minChildSize: 0.28.spMin,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: const SelectPhotoOptions(),
            );
          }),
    );
  }
}
