part of './../../../../core/helpers/export_manager/export_manager.dart';

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
          suffix: signInCubit.passwordIcon,
          isPassword: signInCubit.isPasswordVisible,
          suffixPressed: () {
            signInCubit.togglePasswordVisibility();
          },
          hint: 'Enter Password',
        ),
      ],
    );
  }
}
