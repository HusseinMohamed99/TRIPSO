import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:tripso/screens/password/update_password_screen.dart';
import 'package:tripso/screens/sign_in/sign_in_screen.dart';
import 'package:tripso/shared/components/alert_dialog.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/text_form_field.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:email_auth/email_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../shared/animation/fade_animation.dart';
import '../../shared/components/navigator.dart';
import '../../shared/components/show_toast.dart';
import '../../shared/cubit/restPasswordCubit/rest_password_cubit.dart';
import '../../shared/cubit/restPasswordCubit/rest_password_state.dart';
import '../../shared/styles/asset_path.dart';

enum AuthMode { forgot, verify }

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool submitValid = false;
  AuthMode _authMode = AuthMode.forgot;
  var otpController = TextEditingController();
  var emailController = TextEditingController();
  var forgetFormKey = GlobalKey<FormState>();

  // Declare the object
  EmailAuth? emailAuth;

  @override
  void initState() {
    super.initState();
    // Initialize the package
    emailAuth = EmailAuth(
      sessionName: "TRIPSO APP",
    );
  }

  void sendOtp() async {
    bool result = await emailAuth!
        .sendOtp(recipientMail: emailController.value.text, otpLength: 6);
    if (result) {
      setState(() {
        submitValid = true;
      });
    }
  }

  void verify() {
    emailAuth!.validateOtp(
        recipientMail: emailController.value.text,
        userOtp: otpController.value.text);
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.forgot) {
      setState(() {
        _authMode = AuthMode.verify;
      });
    } else {
      setState(() {
        _authMode = AuthMode.forgot;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: BlocConsumer<ResetPasswordCubit, ResetPasswordStates>(
          listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          showToast(
            state: ToastStates.success,
            text: 'Check your mail',
          );
        }
      }, builder: (context, state) {
        return PlatformScaffold(
          appBar: PlatformAppBar(
            title: Text(
              'Reset Password',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            trailingActions: [
              if (_authMode == AuthMode.verify)
                TextButton(
                  onPressed: sendOtp,
                  child: Text(
                    'Resend Code',
                    style: GoogleFonts.roboto(
                      fontSize: 17,
                      letterSpacing: 1,
                      shadows: [
                        const Shadow(color: Colors.black, offset: Offset(0, -5))
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: primaryColor,
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.dashed,
                    ),
                  ),
                ),
            ],
            leading: IconButton(
              onPressed: () {
                emailController.clear();
                pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            material: (context, __)  => MaterialAppBarData(
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.dark,
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.dark),
              elevation: 0,
              titleSpacing: 1,
            ),
            cupertino: (context, __) => CupertinoNavigationBarData(
              brightness: Brightness.dark,
            ),
          ),

          body: Form(
            key: forgetFormKey,
            child: CustomScrollView(slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    space(width: 0, height: 25),
                    title(),
                    assetImage(),
                    space(width: 0, height: 10),
                    formField(),
                    space(width: 0, height: 50),
                    uId == null
                        ? defaultButton(
                            function: () {
                              if (forgetFormKey.currentState!.validate()) {
                                ResetPasswordCubit.get(context).resetPassword(
                                  email: emailController.text,
                                );
                                alertDialog(
                                  context: context,
                                  title: 'Forget Password?',
                                  function: () {
                                    navigateAndFinish(
                                        context, const SignInScreen());
                                    emailController.clear();
                                  },
                                  content: 'Check your mail',
                                );
                              }
                            },
                            widget: Text(
                              'Verify Email',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontSize: 19,
                                color: const Color(0xffFFFFFF),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            color: primaryColor,
                          )
                        : defaultButton(
                            function: () {
                              if (forgetFormKey.currentState!.validate()) {
                                if (_authMode == AuthMode.forgot) {
                                  sendOtp();
                                  _switchAuthMode();
                                  alertDialog(
                                    context: context,
                                    title: 'Forget Password?',
                                    function: () {
                                      pop(context);
                                    },
                                    content: 'Check your mail',
                                  );
                                } else {
                                  verify();
                                  otpController.clear();
                                  navigateTo(context, const UpdatePassword());
                                }
                              }
                            },
                            widget: Text(
                              _authMode == AuthMode.forgot
                                  ? 'Verify Email'
                                  : 'Confirm',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.roboto(
                                fontSize: 19,
                                color: const Color(0xffFFFFFF),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            color: primaryColor,
                          ),
                  ],
                ),
              ),
            ]),
          ),
        );
      }),
    );
  }

  Widget title() => FittedBox(
        child: Column(
          children: [
            Text(
              _authMode == AuthMode.forgot
                  ? 'Forgot Your Password?'
                  : 'Verify Your Email',
              style: GoogleFonts.roboto(
                  color: primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            space(width: 0, height: 10),
            Text(
              _authMode == AuthMode.forgot
                  ? 'Enter the Email address associated with'
                  : 'Please enter the 6 digit code sent to',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            Text(
              _authMode == AuthMode.forgot
                  ? 'your account'
                  : emailController.text,
              style: GoogleFonts.roboto(
                fontSize: 17,
              ),
            ),
          ],
        ),
      );

  Widget assetImage() => const FadeAnimation(
        1.0,
        child: Image(image: AssetImage(AssetPath.resetPasswordImage)),
      );

  Widget formField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: _authMode == AuthMode.forgot
            ? defaultTextFormField(
                color: Colors.grey.shade400,
                context: context,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                prefix: Icons.alternate_email,
                validate: (value) {
                  if (value!.isEmpty) {
                    return 'Email is Required';
                  }
                  return null;
                },
                hint: 'E-mail Address',
              )
            : (submitValid)
                ? PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: const Color(0xff938E8E).withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: true,
                    obscuringCharacter: '*',
                    obscuringWidget: const FlutterLogo(
                      size: 24,
                    ),
                    blinkWhenObscuring: true,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Digit Code is Required';
                      }
                      return null;
                    },
                    pinTheme: PinTheme(
                      activeColor: secondaryColor,
                      selectedColor: primaryColor,
                      inactiveColor: Colors.grey,
                      disabledColor: Colors.yellow,
                      activeFillColor: secondaryColor,
                      selectedFillColor: secondaryColor,
                      inactiveFillColor: secondaryColor,
                      errorBorderColor: Colors.redAccent,
                      shape: PinCodeFieldShape.circle,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
                      return true;
                    },
                  )
                : PinCodeTextField(
                    appContext: context,
                    pastedTextStyle: TextStyle(
                      color: const Color(0xff938E8E).withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                    ),
                    length: 6,
                    obscureText: true,
                    obscuringCharacter: '*',
                    obscuringWidget: const FlutterLogo(
                      size: 24,
                    ),
                    blinkWhenObscuring: true,
                    //  animationType: AnimationType.fade,
                    validator: (value) {
                      if (value!.length < 6) {
                        return 'Digit Code is Required';
                      }
                      return null;
                    },
                    pinTheme: PinTheme(
                      activeColor: secondaryColor,
                      selectedColor: primaryColor,
                      inactiveColor: Colors.grey,
                      disabledColor: Colors.yellow,
                      activeFillColor: secondaryColor,
                      selectedFillColor: secondaryColor,
                      inactiveFillColor: secondaryColor,
                      errorBorderColor: Colors.redAccent,
                      shape: PinCodeFieldShape.circle,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                    ),
                    cursorColor: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    boxShadows: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        color: Colors.black12,
                        blurRadius: 10,
                      )
                    ],
                    onCompleted: (v) {
                      debugPrint("Completed");
                    },
                    onChanged: (value) {
                      debugPrint(value);
                    },
                    beforeTextPaste: (text) {
                      debugPrint("Allowing to paste $text");
                      return true;
                    },
                  ),
      );
}
