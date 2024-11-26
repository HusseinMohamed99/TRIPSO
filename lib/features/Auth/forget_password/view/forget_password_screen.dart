part of './../../../../core/helpers/export_manager/export_manager.dart';

enum AuthMode { forgot, verify }

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  var emailController = TextEditingController();
  var forgetFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: secondaryAppBar(),
              body: Form(
                key: forgetFormKey,
                child: CustomScrollableForm(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5).r,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                size: 25.sp,
                              ),
                            ),
                            Space(width: 10.w, height: 0.h),
                            Text(
                              'Forgot Your Password?',
                              style: GoogleFonts.roboto(
                                  color: ColorsManager.primaryColor,
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Space(width: 0.w, height: 15.h),
                      title(),
                      assetImage(),
                      formField(),
                      Space(width: 0, height: 20.h),
                      DefaultMaterialButton(
                        context: context,
                        function: () {
                          if (forgetFormKey.currentState!.validate()) {
                            // ForgetPasswordCubit.get(context).resetPassword(
                            //   email: emailController.text,
                            // );
                            MyDialog.showLoadingDialog(context, 'Loading...');
                            MyDialog.hideDialog(context);
                            MyDialog.showMessage(context, 'Check your mail',
                                posActionTitle: 'OK', posAction: () {
                              // navigateAndFinish(context,
                              //     routeName: SignInScreen.routeName);
                              emailController.clear();
                            });
                          }
                        },
                        color: ColorsManager.primaryColor,
                        text: 'Verify Email',
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  Widget title() => FittedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
          child: Column(
            children: [
              Text(
                'Enter the Email address associated with',
                style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Text(
                'your account',
                style: GoogleFonts.roboto(
                  fontSize: 17.sp,
                ),
              ),
            ],
          ),
        ),
      );

  Widget assetImage() =>
      const Image(image: AssetImage(AssetPath.resetPasswordImage));

  Widget formField() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
        child: DefaultTextFormField(
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
        ),
      );
}
