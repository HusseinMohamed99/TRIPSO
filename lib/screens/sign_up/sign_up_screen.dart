import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import '../../shared/animation/fade_animation.dart';
import '../../shared/components/app_bar.dart';
import '../../shared/components/buttons.dart';
import '../../shared/constants/constants.dart';
import '../../shared/components/navigator.dart';
import '../../shared/components/scrollable_form.dart';
import '../../shared/components/show_toast.dart';
import '../../shared/components/sized_box.dart';
import '../../shared/components/text_form_field.dart';
import '../../shared/cubit/SignUpCubit/sign_up_cubit.dart';
import '../../shared/cubit/SignUpCubit/sign_up_state.dart';
import '../../shared/network/cache_helper.dart';
import '../../shared/styles/colors.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'sign_up_screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var firstnameController = TextEditingController();
    var lastnameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => SignUpCubit(),
      child:
          BlocConsumer<SignUpCubit, SignUpStates>(listener: (context, state) {
        if (state is! SignUpLoadingState) {
          showDialog(
              context: context,
              builder: (context) {
                return const Center(child: CircularProgressIndicator());
              });
          if (state is UserCreateSuccessState) {
            CacheHelper.saveData(value: state.uid, key: 'uId').then((value) {
              uId = state.uid;
              showToast(text: 'Sign up Successful', state: ToastStates.success);
              navigateAndFinish(context, routeName: 'HomeScreen');
            });
          }
        }
      }, builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetPath.signUPImage),
              fit: BoxFit.fill,
            ),
          ),
          child: FadeAnimation(
            1.0,
            child: PlatformScaffold(
              backgroundColor: Colors.transparent,
              appBar: defaultAppBar(),
              body: customScrollableForm(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                top: 30, bottom: 50, right: 20, left: 20),
                            child: const Text(
                              'Create Account',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          space(width: 0, height: 32),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'First Name',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                space(width: 0, height: 8),
                                defaultTextFormField(
                                  color: Colors.white30,
                                  context: context,
                                  controller: firstnameController,
                                  keyboardType: TextInputType.name,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'First Name is Required';
                                    }
                                    return null;
                                  },
                                  prefix: Icons.edit_outlined,
                                  hint: 'First Name',
                                ),
                                space(width: 0, height: 20),
                                const Text(
                                  'Last Name',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                space(width: 0, height: 8),
                                defaultTextFormField(
                                  color: Colors.white30,
                                  context: context,
                                  controller: lastnameController,
                                  keyboardType: TextInputType.name,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Last Name is Required';
                                    }
                                    return null;
                                  },
                                  prefix: Icons.edit_outlined,
                                  hint: 'Last Name',
                                ),
                                space(width: 0, height: 20),
                                const Text(
                                  'Email Address',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                space(width: 0, height: 8),
                                defaultTextFormField(
                                  color: Colors.white30,
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
                                  hint: 'Email Address',
                                ),
                                space(width: 0, height: 20),
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                space(width: 0, height: 8),
                                defaultTextFormField(
                                  color: Colors.white30,
                                  context: context,
                                  obscuringCharacter: '*',
                                  controller: passwordController,
                                  keyboardType:
                                      TextInputType.visiblePassword,
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Password is Required";
                                    } else if (value.length < 8) {
                                      return "Use, 8 characters or more for your password";
                                    }
                                    return null;
                                  },
                                  prefix: Icons.lock_outline_sharp,
                                  suffix: SignUpCubit.get(context).suffix,
                                  isPassword:
                                      SignUpCubit.get(context).isPassword,
                                  suffixPressed: () {
                                    SignUpCubit.get(context).showPassword();
                                  },
                                  hint: 'Password',
                                ),
                              ],
                            ),
                          ),
                          space(width: 0, height: 70),
                          defaultMaterialButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                SignUpCubit.get(context).userSignUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  firstName: firstnameController.text,
                                  lastName: lastnameController.text,
                                );
                                emailController.clear();
                                passwordController.clear();
                                firstnameController.clear();
                                lastnameController.clear();
                              }
                            },
                            text: 'Sign up',
                            color: primaryColor,
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
      }),
    );
  }
}
