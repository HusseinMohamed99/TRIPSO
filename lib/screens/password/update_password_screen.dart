import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/screens/sign_in/sign_in_screen.dart';
import '../../shared/animation/fade_animation.dart';
import '../../shared/components/buttons.dart';
import '../../shared/components/navigator.dart';
import '../../shared/components/sized_box.dart';
import '../../shared/components/text_form_field.dart';
import '../../shared/cubit/tripsoCubit/tripso_cubit.dart';
import '../../shared/cubit/tripsoCubit/tripso_state.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/asset_path.dart';

class UpdatePassword extends StatelessWidget {
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var newPasswordController = TextEditingController();
    var confirmationPasswordController = TextEditingController();

    return BlocConsumer<TripsoCubit, TripsoStates>(
          listener: (context, state)
          {
            if(state is ChangeUserPasswordSuccessState)
            {
              navigateAndFinish(context, const SignInScreen());
            }
          },
          builder: (context, state) {
            var updatePasswordKey = GlobalKey<FormState>();
            var cubit = TripsoCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                systemOverlayStyle: const SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.dark,
                    statusBarColor: Colors.transparent,
                    statusBarIconBrightness: Brightness.dark),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    newPasswordController.clear();
                    confirmationPasswordController.clear();
                    pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                ),
                titleSpacing: 1,
                title: Text(
                  'New Password',
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              body: Form(
                key: updatePasswordKey,
                child: CustomScrollView(slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        space(width: 0, height: 50),
                        FittedBox(
                          child: Text(
                            'Create New Password?',
                            style: GoogleFonts.roboto(
                                color: primaryColor,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        space(width: 0, height: 10),
                        FittedBox(
                          child: Text(
                            'Your new password must be different\n'
                            '         from previous used password',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.5),
                            ),
                          ),
                        ),
                        const FadeAnimation(
                          1.0,
                          child: Image(
                              height: 300,
                              image: AssetImage(AssetPath.changePasswordImage)),
                        ),
                        space(width: 0, height: 60),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Column(
                            children: [
                              defaultTextFormField(
                          color:Colors.grey.shade400,
                                context: context,
                                controller: newPasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscuringCharacter: '*',
                                validate: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'Password is Required';
                                  }
                                  if (value !=
                                      confirmationPasswordController.text) {
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
                              space(width: 0, height: 30),
                              defaultTextFormField(
                                color:Colors.grey.shade400,
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
                        ),
                        space(width: 0, height: 50),
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
                                  if (updatePasswordKey.currentState!
                                      .validate()) {
                                    cubit.changeUserPassword(
                                      password: newPasswordController.text,
                                    );
                                    newPasswordController.clear();
                                    confirmationPasswordController.clear();
                                  }
                                },
                              )
                      ],
                    ),
                  ),
                ]),
              ),
            );
          });
  }
}
