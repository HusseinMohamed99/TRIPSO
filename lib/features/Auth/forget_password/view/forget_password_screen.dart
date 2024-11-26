part of './../../../../core/helpers/export_manager/export_manager.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final forgetPasswordCubit = context.read<ForgetPasswordCubit>();
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
      listener: (context, state) {
        if (state is ForgetPasswordLoadingState) {
          context.showSnackBar('Loading...');
        } else if (state is ForgetPasswordSuccessfulState) {
          context.showSnackBar(
              'Check your email for password reset instructions.');
        } else if (state is ForgetPasswordFailureState) {
          context.showSnackBar(state.error, color: ColorsManager.redColor);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: TitleAndImage(),
              ),
              SliverToBoxAdapter(
                child: ForgetPasswordFormField(
                  forgetPasswordCubit: forgetPasswordCubit,
                ),
              ),
            ],
          ).allPadding(
            hPadding: 24,
            vPadding: 24,
          ),
        );
      },
    );
  }
}

class TitleAndImage extends StatelessWidget {
  const TitleAndImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Enter the email address associated',
          style: context.titleLarge,
        ),
        Text(
          'with your account',
          style: context.titleLarge!.copyWith(
            color: ColorsManager.blackPrimary,
          ),
        ),
        Image(image: AssetImage(AssetPath.resetPasswordImage)),
      ],
    );
  }
}

class ForgetPasswordFormField extends StatelessWidget {
  const ForgetPasswordFormField({
    super.key,
    required this.forgetPasswordCubit,
  });
  final ForgetPasswordCubit forgetPasswordCubit;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: forgetPasswordCubit.formKey,
      child: Column(
        children: [
          DefaultTextFormField(
            color: ColorsManager.blackPrimary.withOpacity(0.3),
            context: context,
            hint: 'Email Address',
            prefix: Icons.alternate_email,
            keyboardType: TextInputType.emailAddress,
            validate: (String? value) {
              return ValidationManager.emailValidator(value);
            },
            controller: forgetPasswordCubit.emailController,
          ).onlyPadding(bottomPadding: 20),
          DefaultMaterialButton(
            context: context,
            function: () {
              if (forgetPasswordCubit.formKey.currentState!.validate()) {
                forgetPasswordCubit.resetPassword(
                  email: forgetPasswordCubit.emailController.text,
                );
              }
            },
            color: ColorsManager.primaryColor,
            text: 'Send',
          ),
        ],
      ),
    );
  }
}
