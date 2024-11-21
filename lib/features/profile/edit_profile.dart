import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/show_toast.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/text_form_field.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/widget/select_photo_options.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  static const String routeName = 'EditProfile';
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var tripsoCubit = TripsoCubit.get(context).userModel;
    firstNameController.text = tripsoCubit!.firstName;
    lastNameController.text = tripsoCubit.lastName;
    phoneController.text = tripsoCubit.phone;
    emailController.text = tripsoCubit.email;
    addressController.text = tripsoCubit.address;
    var formKey = GlobalKey<FormState>();
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {
        if (state is UpdateUserSuccessState) {
          showToast(
              text: 'Update Data Successfully', state: ToastStates.success);
        }
      },
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
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 67.r,
                              backgroundColor: ColorsManager.primaryColor,
                              child: CircleAvatar(
                                backgroundColor: ColorsManager.whiteColor,
                                radius: 65.r,
                                child: CircleAvatar(
                                  radius: 65.r,
                                  child: profileImage == null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(65).r,
                                          child: CachedNetworkImage(
                                            imageUrl: tripsoCubit.image!,
                                            fit: BoxFit.fill,
                                            height: 200.h,
                                            width: double.infinity,
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                Center(
                                              child: AdaptiveIndicator(
                                                os: getOs(),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) => Center(
                                              child: AdaptiveIndicator(
                                                os: getOs(),
                                              ),
                                            ),
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(65).r,
                                          child: Image(
                                            image: FileImage(profileImage),
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 75.h,
                              left: 90.w,
                              child: CircleAvatar(
                                radius: 22.r,
                                backgroundColor: ColorsManager.primaryColor,
                                child: IconButton(
                                  splashRadius: 1,
                                  onPressed: () {
                                    showSelectPhotoOptions(context);
                                  },
                                  icon: Icon(
                                    IconlyLight.image,
                                    color: ColorsManager.whiteColor,
                                    size: 30.sp,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Space(height: 40.h, width: 0.w),
                        DefaultTextFormField(
                          borderSideColor: ColorsManager.blackPrimary,
                          styleColor: ColorsManager.blackPrimary,
                          prefixColor: ColorsManager.blackPrimary,
                          context: context,
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          validate: (String? value) {
                            if (value!.trim().isEmpty || value.length < 3) {
                              return 'First name must not be empty !';
                            }
                            return null;
                          },
                          label: 'First name',
                          prefix: Icons.account_circle_outlined,
                        ),
                        Space(
                          height: 26.h,
                          width: 0,
                        ),
                        DefaultTextFormField(
                          borderSideColor: ColorsManager.blackPrimary,
                          styleColor: ColorsManager.blackPrimary,
                          prefixColor: ColorsManager.blackPrimary,
                          context: context,
                          controller: lastNameController,
                          keyboardType: TextInputType.name,
                          validate: (String? value) {
                            if (value!.trim().isEmpty || value.length < 3) {
                              return 'Last name must not be empty !';
                            }
                            return null;
                          },
                          label: 'Last name',
                          prefix: Icons.account_circle_outlined,
                        ),
                        Space(
                          height: 26.h,
                          width: 0,
                        ),
                        DefaultTextFormField(
                          borderSideColor: ColorsManager.blackPrimary,
                          styleColor: ColorsManager.blackPrimary,
                          prefixColor: ColorsManager.blackPrimary,
                          context: context,
                          controller: addressController,
                          keyboardType: TextInputType.streetAddress,
                          validate: (String? value) {
                            if (value!.trim().isEmpty || value.length < 3) {
                              return 'Street Address must not be empty !';
                            }
                            return null;
                          },
                          label: 'Address',
                          prefix: Icons.location_city,
                        ),
                        Space(
                          height: 26.h,
                          width: 0,
                        ),
                        DefaultTextFormField(
                          borderSideColor: ColorsManager.blackPrimary,
                          styleColor: ColorsManager.blackPrimary,
                          prefixColor: ColorsManager.blackPrimary,
                          context: context,
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validate: (String? value) {
                            if (value!.trim().isEmpty ||
                                value.length < 11 ||
                                value.length > 11) {
                              return 'An Egyptian phone number consisting of 11 digits';
                            }
                            return null;
                          },
                          label: 'phone number',
                          prefix: Icons.phone,
                        ),
                        Space(
                          height: 26.h,
                          width: 0,
                        ),
                        DefaultTextFormField(
                          borderSideColor: ColorsManager.blackPrimary,
                          styleColor: ColorsManager.blackPrimary,
                          prefixColor: ColorsManager.blackPrimary,
                          context: context,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.trim().isEmpty || value.length < 16) {
                              return 'Sorry, your mail must be\n between 16 and 30 characters long.';
                            }
                            return null;
                          },
                          prefix: Icons.alternate_email,
                          label: 'Email Address',
                        ),
                        Space(
                          height: 30.h,
                          width: 0.w,
                        ),
                        defaultButton(
                          color: ColorsManager.primaryColor,
                          function: () {
                            if (formKey.currentState!.validate()) {
                              if (cubit.profileImage != null) {
                                cubit.uploadProfileImage(
                                  firstName: firstNameController.text,
                                  phone: phoneController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  // address: addressController.text,
                                );
                              } else {
                                cubit.updateUserData(
                                  firstName: firstNameController.text,
                                  lastName: lastNameController.text,
                                  email: emailController.text,
                                  phone: phoneController.text,
                                  address: addressController.text,
                                );
                              }
                            }
                          },
                          widget: Text(
                            'Confirm',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 19.sp,
                              color: ColorsManager.whiteColor,
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
                            color: ColorsManager.primaryColor,
                          ),
                      ],
                    ),
                  ],
                ),
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
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25.0),
        ).r,
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
        },
      ),
    );
  }
}
