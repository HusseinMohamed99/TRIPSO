part of './../../../../core/helpers/export_manager/export_manager.dart';

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
