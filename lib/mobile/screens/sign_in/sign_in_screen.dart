import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/mobile/screens/home/home_screen.dart';
import 'package:tripso/mobile/screens/password/forget_password_screen.dart';
import 'package:tripso/mobile/screens/sign_up/sign_up_screen.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/animation/fade_animation.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/show_toast.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/text_form_field.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/SignInCubit/sign_in_state.dart';
import 'package:tripso/shared/cubit/signInCubit/sign_in_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/network/cache_helper.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/theme.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = 'sign_in_screen';

  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SignInCubit(),
      child:
          BlocConsumer<SignInCubit, SignInStates>(listener: (context, state) {
        if (state is SignInLoadingState) {
          MyDialog.showLoadingDialog(context, 'Loading...');
        }
        if (state is SignInSuccessState) {
          showToast(text: 'Login is Successfully', state: ToastStates.success);
          MyDialog.showLoadingDialog(context, 'Login is successfully');
          CacheHelper.saveData(value: state.uid, key: 'uId').then(
            (value) {
              uId = state.uid;
              MyDialog.hideDialog(context);
              TripsoCubit.get(context).getUserData();
              navigateAndFinish(context, routeName: CitiesScreen.routeName);
            },
          );
        } else if (state is SignInErrorState) {
          MyDialog.showLoadingDialog(context, 'Login is Error');
          MyDialog.hideDialog(context);
          MyDialog.showMessage(
            context,
            state.error,
            negActionTitle: 'Try Again',
            negAction: () {
              Navigator.pop(context);
            },
          );
        }
      }, builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetPath.signINImage),
              fit: BoxFit.fill,
            ),
          ),
          child: FadeAnimation(
            1.5,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: secondaryAppBar(),
              body: Center(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20)
                                        .r,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Email Address',
                                      style: TextStyle(
                                        color: ThemeApp.secondaryColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Space(width: 0.w, height: 8.h),
                                    DefaultTextFormField(
                                      color: ThemeApp.secondaryColor
                                          .withOpacity(0.3),
                                      context: context,
                                      controller: emailController,
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
                                        color: ThemeApp.secondaryColor,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Space(width: 0.w, height: 8.h),
                                    DefaultTextFormField(
                                      color: ThemeApp.secondaryColor
                                          .withOpacity(0.3),
                                      context: context,
                                      controller: passwordController,
                                      obscuringCharacter: '*',
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      validate: (String? value) {
                                        if (value!.trim().isEmpty) {
                                          return 'Password is Required';
                                        }
                                        return null;
                                      },
                                      prefix: Icons.lock_outline_sharp,
                                      suffix: SignInCubit.get(context).suffix,
                                      isPassword:
                                          SignInCubit.get(context).isPassword,
                                      suffixPressed: () {
                                        SignInCubit.get(context).showPassword();
                                      },
                                      hint: 'Enter Password',
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20)
                                        .r,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        navigateTo(context,
                                            routeName:
                                                ForgotPassword.routeName);
                                      },
                                      child: Text(
                                        'Forgot Password ?',
                                        style: TextStyle(
                                            color: ThemeApp.primaryColor,
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
                              child: defaultMaterialButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    SignInCubit.get(context).userSignIn(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                text: 'Sign in',
                                color: ThemeApp.primaryColor,
                              ),
                            ),
                            Space(width: 0.w, height: 10.h),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0)
                                      .r,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                        color: ThemeApp.secondaryColor,
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
                                          color: ThemeApp.primaryColor,
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
          ),
        );
      }),
    );
  }
}
