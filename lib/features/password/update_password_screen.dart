import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/core/styles/asset_path.dart';
import 'package:tripso/features/sign_in/sign_in_screen.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/scrollable_form.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/text_form_field.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class UpdatePassword extends StatelessWidget {
  static const String routeName = 'update_password_screen';

  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TripsoCubit(),
      child:
          BlocConsumer<TripsoCubit, TripsoStates>(listener: (context, state) {
        if (state is ChangeUserPasswordLoadingState) {
          MyDialog.showLoadingDialog(context, 'Loading...');
        }

        if (state is ChangeUserPasswordSuccessState) {
          MyDialog.showLoadingDialog(
              context, 'Change password is successfully');
          MyDialog.hideDialog(context);
          navigateAndFinish(context, routeName: SignInScreen.routeName);
        } else if (state is ChangeUserPasswordErrorState) {
          MyDialog.showLoadingDialog(context, 'Change password is Error');
          MyDialog.hideDialog(context);
          MyDialog.showMessage(context, 'Change password is Error',
              negActionTitle: 'Cancel', negAction: () {
            Navigator.pop(context);
          });
        }
      }, builder: (context, state) {
        var newPasswordController = TextEditingController();
        var confirmationPasswordController = TextEditingController();
        var updatePasswordKey = GlobalKey<FormState>();
        var cubit = TripsoCubit.get(context);
        return Scaffold(
          appBar: primaryAppBar(
            title: '',
            function: () {
              newPasswordController.clear();
              confirmationPasswordController.clear();
              pop(context);
            },
            iconData: Icon(
              Icons.arrow_back,
              size: 25.sp,
            ),
          ),
          body: Form(
            key: updatePasswordKey,
            child: CustomScrollableForm(
              child: Column(
                children: [
                  title(),
                  assetImage(),
                  Column(
                    children: [
                      PasswordFormField(
                          newPasswordController: newPasswordController,
                          confirmationPasswordController:
                              confirmationPasswordController,
                          cubit: cubit),
                      Space(width: 0.w, height: 30.h),
                      buildDefaultButton(
                          updatePasswordKey,
                          cubit,
                          newPasswordController,
                          confirmationPasswordController),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget buildDefaultButton(
          GlobalKey<FormState> updatePasswordKey,
          TripsoCubit cubit,
          TextEditingController newPasswordController,
          TextEditingController confirmationPasswordController) =>
      defaultButton(
        color: ColorsManager.primaryColor,
        widget: Text(
          'Change Password',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 19.sp,
            color: ColorsManager.whiteColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        function: () {
          if (updatePasswordKey.currentState!.validate()) {
            cubit.changeUserPassword(
              password: newPasswordController.text,
            );
          }
        },
      );

  Widget title() => FittedBox(
        child: Column(
          children: [
            Text(
              'Create New Password?',
              style: GoogleFonts.roboto(
                  color: ColorsManager.primaryColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500),
            ),
            Space(width: 0.w, height: 10.h),
            Text(
              'Your new password must be different\n'
              '         from previous used password',
              style: GoogleFonts.roboto(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      );

  Widget assetImage() => Image(
        image: const AssetImage(AssetPath.changePasswordImage),
        height: 300.h,
      );
}

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    super.key,
    required this.newPasswordController,
    required this.confirmationPasswordController,
    required this.cubit,
  });

  final TextEditingController newPasswordController;
  final TextEditingController confirmationPasswordController;
  final TripsoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
      child: Column(
        children: [
          DefaultTextFormField(
            color: Colors.grey.shade400,
            context: context,
            controller: newPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscuringCharacter: '*',
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'Password is Required';
              }
              if (value != confirmationPasswordController.text) {
                return ' Password is not the same';
              }
              return null;
            },
            prefix: Icons.lock_outline_sharp,
            suffix: cubit.suffix,
            isPassword: cubit.isPassword,
            suffixPressed: () {
              cubit.showPassword();
            },
            hint: 'Password',
          ),
          Space(width: 0.w, height: 20.h),
          DefaultTextFormField(
            color: Colors.grey.shade400,
            context: context,
            controller: confirmationPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscuringCharacter: '*',
            validate: (value) {
              if (value!.isEmpty) {
                return 'Password is Required';
              }
              if (value != newPasswordController.text) {
                return ' Password is not the same';
              }
              return null;
            },
            prefix: Icons.lock_outline_sharp,
            suffix: cubit.suffix,
            isPassword: cubit.isPassword,
            suffixPressed: () {
              cubit.showPassword();
            },
            hint: 'Confirm Password',
          )
        ],
      ),
    );
  }
}
