part of './../../../../core/helpers/export_manager/export_manager.dart';

class SignUpInputField extends StatelessWidget {
  const SignUpInputField({
    super.key,
    required this.signUpCubit,
  });

  final SignUpCubit signUpCubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Space(height: context.height * .05, width: 0),
        SignUpTitleField(
          title: 'First Name',
        ),
        SignUpFormField(
          hint: 'First Name',
          prefix: Icons.edit_outlined,
          keyboardType: TextInputType.name,
          validate: (String? value) {
            return ValidationManager.displayNameValidator(value);
          },
          controller: signUpCubit.userFirstNameController,
        ),
        SignUpTitleField(title: 'Last Name'),
        SignUpFormField(
          hint: 'Last Name',
          prefix: Icons.edit_outlined,
          keyboardType: TextInputType.name,
          validate: (String? value) {
            return ValidationManager.displayNameValidator(value);
          },
          controller: signUpCubit.userLastNameController,
        ),
        SignUpTitleField(title: 'Email Address'),
        SignUpFormField(
          hint: 'Email Address',
          prefix: Icons.alternate_email,
          keyboardType: TextInputType.emailAddress,
          validate: (String? value) {
            return ValidationManager.emailValidator(value);
          },
          controller: signUpCubit.emailController,
        ),
        SignUpTitleField(title: 'Mobile Number'),
        SignUpFormField(
          hint: 'Mobile Number',
          controller: signUpCubit.phoneController,
          prefix: Icons.phone_android,
          keyboardType: TextInputType.phone,
          validate: (String? value) {
            return ValidationManager.phoneValidator(value);
          },
        ),
        SignUpTitleField(title: 'Password'),
        SignUpFormField(
          hint: 'Password',
          prefix: Icons.lock_outline_sharp,
          controller: signUpCubit.passwordController,
          keyboardType: TextInputType.visiblePassword,
          validate: (String? value) {
            return ValidationManager.passwordValidator(value);
          },
        ),
      ],
    );
  }
}

class SignUpFormField extends StatelessWidget {
  const SignUpFormField({
    super.key,
    required this.hint,
    required this.prefix,
    this.keyboardType,
    required this.validate,
    required this.controller,
  });

  final String hint;
  final IconData prefix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validate;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return DefaultTextFormField(
      color: ColorsManager.whiteColor.withOpacity(0.3),
      context: context,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      validate: (String? value) {
        return validate!(value);
      },
      prefix: prefix,
      hint: hint,
    ).onlyPadding(bottomPadding: 20);
  }
}

class SignUpTitleField extends StatelessWidget {
  const SignUpTitleField({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.labelLarge!.copyWith(
        color: ColorsManager.whiteColor,
      ),
    ).onlyPadding(bottomPadding: 8);
  }
}
