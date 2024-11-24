part of './../../../../core/helpers/export_manager/export_manager.dart';

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
