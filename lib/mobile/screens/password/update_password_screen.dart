import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/mobile/screens/sign_in/sign_in_screen.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/animation/fade_animation.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/scrollable_form.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/text_form_field.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/colors.dart';

class UpdatePassword extends StatelessWidget {
  static const String routeName = 'update_password_screen';

  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var newPasswordController = TextEditingController();
    var confirmationPasswordController = TextEditingController();
    var updatePasswordKey = GlobalKey<FormState>();
    var cubit = TripsoCubit.get(context);

    return BlocConsumer<TripsoCubit, TripsoStates>(listener: (context, state) {
      if (state is ChangeUserPasswordLoadingState) {
        MyDialog.showLoadingDialog(context, 'Loading...');
      }
      if (state is ChangeUserPasswordSuccessState) {
        MyDialog.showLoadingDialog(context, 'Change password is successfully');
        MyDialog.hideDialog(context);
        navigateAndFinish(context, routeName: SignInScreen.routeName);
      } else if (state is ChangeUserPasswordErrorState) {
        MyDialog.showLoadingDialog(context, 'Change password is Error');
        MyDialog.hideDialog(context);
        MyDialog.showMessage(context, 'Change password is Error',
            posActionTitle: 'Try Again',
            posAction: () {
              if (updatePasswordKey.currentState!.validate()) {
                cubit.changeUserPassword(
                  password: newPasswordController.text,
                );
                MyDialog.hideDialog(context);
              }
              MyDialog.hideDialog(context);
            },
            negActionTitle: 'Cancel',
            negAction: () {
              Navigator.pop(context);
            });
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: primaryAppBar(
          title: 'New Password',
          function: () {
            newPasswordController.clear();
            confirmationPasswordController.clear();
            pop(context);
          },
          iconData: const Icon(
            Icons.arrow_back,
          ),
        ),
        body: Form(
          key: updatePasswordKey,
          child: CustomScrollableForm(
            child: Column(
              children: [
                title(),
                assetImage(),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      PasswordFormField(
                          newPasswordController: newPasswordController,
                          confirmationPasswordController:
                              confirmationPasswordController,
                          cubit: cubit),
                      const Space(width: 0, height: 30),
                      buildDefaultButton(
                          updatePasswordKey,
                          cubit,
                          newPasswordController,
                          confirmationPasswordController),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildDefaultButton(
          GlobalKey<FormState> updatePasswordKey,
          TripsoCubit cubit,
          TextEditingController newPasswordController,
          TextEditingController confirmationPasswordController) =>
      defaultButton(
        color: primaryColor,
        widget: Text(
          'Change Password',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 19,
            color: const Color(0xffFFFFFF),
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
        child: Expanded(
          flex: 3,
          child: Column(
            children: [
              Text(
                'Create New Password?',
                style: GoogleFonts.roboto(
                    color: primaryColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
              const Space(width: 0, height: 10),
              Text(
                'Your new password must be different\n'
                '         from previous used password',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      );

  Widget assetImage() => const FadeAnimation(
        1.0,
        child: Image(
          image: AssetImage(
            AssetPath.changePasswordImage,
          ),
          height: 300,
        ),
      );
}

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    Key? key,
    required this.newPasswordController,
    required this.confirmationPasswordController,
    required this.cubit,
  }) : super(key: key);

  final TextEditingController newPasswordController;
  final TextEditingController confirmationPasswordController;
  final TripsoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
          const Space(width: 0, height: 30),
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

// import 'package:flutter/material.dart';
//
// import 'auth.dart';
//
// class UpdatePassword extends StatefulWidget {
//   const UpdatePassword({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _UpdatePasswordState createState() => _UpdatePasswordState();
// }
//
// class _UpdatePasswordState extends State<UpdatePassword> {
//   final TextEditingController _passController = TextEditingController();
//
//   final TextEditingController _confirmPassController = TextEditingController();
//
//   Future<void> _submit(String newPassword) async {
//     await AuthServices().changePassword(newPassword);
//   }
