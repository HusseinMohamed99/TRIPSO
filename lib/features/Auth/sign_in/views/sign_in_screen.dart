import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/core/routing/routes.dart';
import 'package:tripso/core/styles/asset_path.dart';
import 'package:tripso/shared/components/buttons.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/text_form_field.dart';
import 'package:tripso/shared/cubit/SignInCubit/sign_in_state.dart';
import 'package:tripso/shared/cubit/signInCubit/sign_in_cubit.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key, required this.sharedPrefHelper});
  final SharedPrefHelper sharedPrefHelper;

  @override
  Widget build(BuildContext context) {
    final signInCubit = context.read<SignInCubit>();

    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInLoadingState) {
          context.showSnackBar('Loading...', color: ColorsManager.primaryColor);
        } else if (state is SignInSuccessState) {
          context.showSnackBar(
            'Sign in Successfully',
            color: ColorsManager.greenColor,
          );
        } else if (state is SignInErrorState) {
          context.showSnackBar(state.error, color: ColorsManager.redColor);
        }
      },
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetPath.signINImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: signInCubit.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InputField(signInCubit: signInCubit),
                      ForgetPasswordButton(),
                      Space(width: 0, height: 20),
                      SingInButton(signInCubit: signInCubit),
                      Space(width: 0, height: 10),
                      IfHaveAccount(),
                    ],
                  ).allPadding(hPadding: 20),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SingInButton extends StatelessWidget {
  const SingInButton({
    super.key,
    required this.signInCubit,
  });

  final SignInCubit signInCubit;

  @override
  Widget build(BuildContext context) {
    return DefaultMaterialButton(
      context: context,
      function: () {
        if (signInCubit.formKey.currentState!.validate()) {
          signInCubit.userSignIn(
            email: signInCubit.emailController.text,
            password: signInCubit.passwordController.text,
          );
        }
      },
      text: 'Sign in',
      color: ColorsManager.primaryColor,
    );
  }
}

class IfHaveAccount extends StatelessWidget {
  const IfHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Don\'t have an account?',
          style: context.labelLarge!.copyWith(
            color: ColorsManager.whiteColor,
          ),
        ),
        TextButton(
          onPressed: () {
            context.pushNamed(Routes.signUpScreen);
          },
          child: Text(
            'SignUp Now !',
            style: context.labelLarge,
          ),
        ),
      ],
    );
  }
}

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.zero,
      ),
      onPressed: () {
        context.pushNamed(Routes.forgetPassword);
      },
      child: Text(
        'Forgot Password ?',
        style: context.labelLarge,
      ),
    );
  }
}

class InputField extends StatelessWidget {
  const InputField({
    super.key,
    required this.signInCubit,
  });

  final SignInCubit signInCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email Address',
          style: context.labelLarge!.copyWith(
            color: ColorsManager.whiteColor,
          ),
        ).onlyPadding(bottomPadding: 8),
        DefaultTextFormField(
          color: ColorsManager.whiteColor.withOpacity(0.3),
          context: context,
          controller: signInCubit.emailController,
          keyboardType: TextInputType.emailAddress,
          validate: (String? value) {
            return ValidationManager.emailValidator(value);
          },
          hint: 'Email Address',
          prefix: Icons.alternate_email,
        ).onlyPadding(bottomPadding: 20),
        Text(
          'Password',
          style: context.labelLarge!.copyWith(
            color: ColorsManager.whiteColor,
          ),
        ).onlyPadding(bottomPadding: 8),
        DefaultTextFormField(
          color: ColorsManager.whiteColor.withOpacity(0.3),
          context: context,
          controller: signInCubit.passwordController,
          obscuringCharacter: '*',
          keyboardType: TextInputType.visiblePassword,
          validate: (String? value) {
            return ValidationManager.passwordValidator(value);
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
    );
  }
}
