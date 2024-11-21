import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/core/styles/asset_path.dart';
import 'package:tripso/features/Auth/sign_up/sign_up_screen.dart';
import 'package:tripso/features/home/home_screen.dart';
import 'package:tripso/features/password/forget_password_screen.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/text_form_field.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/SignInCubit/sign_in_state.dart';
import 'package:tripso/shared/cubit/signInCubit/sign_in_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/network/cache_helper.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key, required this.sharedPrefHelper});
  final SharedPrefHelper sharedPrefHelper;

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();

    return BlocConsumer<SignInCubit, SignInStates>(listener: (context, state) {
      if (state is SignInLoadingState) {
        context.showSnackBar('Loading...', color: ColorsManager.primaryColor);
      } else if (state is SignInSuccessState) {
        context.showSnackBar('Sign in Successfully',
            color: ColorsManager.greenColor);
        CacheHelper.saveData(value: state.uid, key: 'uId').then((value) {
          uId = state.uid;
          TripsoCubit.get(context).getUserData();
          navigateAndFinish(context, routeName: CitiesScreen.routeName);
        });
      } else if (state is SignInErrorState) {
        context.showSnackBar(state.error, color: ColorsManager.redColor);
      }
    }, builder: (context, state) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetPath.signINImage),
            fit: BoxFit.fill,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: secondaryAppBar(),
          body: Center(
            child: Form(
              key: signInCubit.formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20).r,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email Address',
                                  style: TextStyle(
                                    color: ColorsManager.whiteColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Space(width: 0.w, height: 8.h),
                                DefaultTextFormField(
                                  color:
                                      ColorsManager.whiteColor.withOpacity(0.3),
                                  context: context,
                                  controller: signInCubit.emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  validate: (String? value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Email Address is Required';
                                    }
                                    return null;
                                  },
                                  hint: 'Email Address',
                                  prefix: Icons.alternate_email,
                                ),
                                Space(width: 0.w, height: 26.h),
                                Text(
                                  'Password',
                                  style: TextStyle(
                                    color: ColorsManager.whiteColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Space(width: 0.w, height: 8.h),
                                DefaultTextFormField(
                                  color:
                                      ColorsManager.whiteColor.withOpacity(0.3),
                                  context: context,
                                  controller: signInCubit.passwordController,
                                  obscuringCharacter: '*',
                                  keyboardType: TextInputType.visiblePassword,
                                  validate: (String? value) {
                                    if (value!.trim().isEmpty) {
                                      return 'Password is Required';
                                    }
                                    return null;
                                  },
                                  prefix: Icons.lock_outline_sharp,
                                  suffix: signInCubit.suffix,
                                  isPassword: signInCubit.isPassword,
                                  suffixPressed: () {
                                    signInCubit.showPassword();
                                  },
                                  hint: 'Enter Password',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20).r,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    navigateTo(context,
                                        routeName: ForgotPassword.routeName);
                                  },
                                  child: Text(
                                    'Forgot Password ?',
                                    style: TextStyle(
                                        color: ColorsManager.primaryColor,
                                        fontSize: 15.sp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Space(width: 0.w, height: 20.h),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: DefaultMaterialButton(
                            context: context,
                            function: () {
                              if (signInCubit.formKey.currentState!
                                  .validate()) {
                                signInCubit.userSignIn(
                                  email: signInCubit.emailController.text,
                                  password: signInCubit.passwordController.text,
                                );
                              }
                            },
                            text: 'Sign in',
                            color: ColorsManager.primaryColor,
                          ),
                        ),
                        Space(width: 0.w, height: 10.h),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20.0).r,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: TextStyle(
                                    color: ColorsManager.whiteColor,
                                    fontSize: 15.sp),
                              ),
                              TextButton(
                                onPressed: () {
                                  navigateTo(context,
                                      routeName: SignUpScreen.routeName);
                                },
                                child: Text(
                                  'SignUp Now!',
                                  style: TextStyle(
                                      color: ColorsManager.primaryColor,
                                      fontSize: 15.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
