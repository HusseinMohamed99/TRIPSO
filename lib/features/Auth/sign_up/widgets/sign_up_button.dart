part of './../../../../core/helpers/export_manager/export_manager.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key, required this.signUpCubit});
  final SignUpCubit signUpCubit;
  @override
  Widget build(BuildContext context) {
    return DefaultMaterialButton(
      context: context,
      function: () {
        if (signUpCubit.formKey.currentState!.validate()) {
          signUpCubit.userSignUp(
            email: signUpCubit.emailController.text,
            phone: signUpCubit.phoneController.text,
            password: signUpCubit.passwordController.text,
            firstName: signUpCubit.userFirstNameController.text,
            lastName: signUpCubit.userLastNameController.text,
          );
        }
      },
      text: 'Sign up',
      color: ColorsManager.primaryColor,
    );
  }
}
