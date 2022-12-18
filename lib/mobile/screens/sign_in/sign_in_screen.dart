import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/mobile/screens/home/home_screen.dart';
import 'package:tripso/mobile/screens/password/forget_password_screen.dart';
import 'package:tripso/mobile/screens/sign_up/sign_up_screen.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/animation/fade_animation.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/scrollable_form.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/text_form_field.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/SignInCubit/sign_in_state.dart';
import 'package:tripso/shared/cubit/signInCubit/sign_in_cubit.dart';
import 'package:tripso/shared/network/cache_helper.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/colors.dart';

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
          MyDialog.showLoadingDialog(context, 'Login is successfully');
          CacheHelper.saveData(value: state.uid, key: 'uId').then((value) {
            uId = state.uid;
            MyDialog.hideDialog(context);
            navigateAndFinish(context, routeName: HomeScreen.routeName);
          });
        } else if (state is SignInErrorState) {
          MyDialog.showLoadingDialog(context, 'Login is Error');
          MyDialog.hideDialog(context);
          MyDialog.showMessage(context, 'Login is Error',
              posActionTitle: 'Try Again',
              posAction: () {
                if (formKey.currentState!.validate()) {
                  SignInCubit.get(context).userSignIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  emailController.clear();
                  passwordController.clear();
                }
              },
              negActionTitle: 'Cancel',
              negAction: () {
                Navigator.pop(context);
              });
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
              body: CustomScrollableForm(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email Address',
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Space(width: 0, height: 8),
                                  DefaultTextFormField(
                                    color: secondaryColor.withOpacity(0.3),
                                    context: context,
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Email Address is Required';
                                      }
                                      return null;
                                    },
                                    hint: 'Email Address',
                                    prefix: Icons.alternate_email,
                                  ),
                                  const Space(width: 0, height: 26),
                                  const Text(
                                    'Password',
                                    style: TextStyle(
                                      color: secondaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const Space(width: 0, height: 8),
                                  DefaultTextFormField(
                                    color: secondaryColor.withOpacity(0.3),
                                    context: context,
                                    controller: passwordController,
                                    obscuringCharacter: '*',
                                    keyboardType: TextInputType.visiblePassword,
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
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
                                  const EdgeInsets.symmetric(horizontal: 50),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      navigateTo(context,
                                          routeName: ForgotPassword.routeName);
                                    },
                                    child: const Text(
                                      'Forgot Password ?',
                                      style: TextStyle(
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Space(width: 0, height: 30),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Center(
                              child: defaultMaterialButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    SignInCubit.get(context).userSignIn(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                    emailController.clear();
                                    passwordController.clear();
                                  }
                                },
                                text: 'Sign in',
                                color: primaryColor,
                              ),
                            ),
                            const Space(width: 0, height: 28),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(color: secondaryColor),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      navigateTo(context,
                                          routeName: SignUpScreen.routeName);
                                    },
                                    child: const Text(
                                      'SignUp Now!',
                                      style: TextStyle(
                                        color: primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
