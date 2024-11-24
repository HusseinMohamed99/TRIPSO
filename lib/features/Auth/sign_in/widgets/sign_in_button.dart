part of './../../../../core/helpers/export_manager/export_manager.dart';

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
