part of './../../../../core/helpers/export_manager/export_manager.dart';

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
          sharedPrefHelper.isUserLogged();
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
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetPath.signINImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(
                width: double.infinity,
                height: context.height * .5,
                child: Form(
                  key: signInCubit.formKey,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child:
                            Center(child: InputField(signInCubit: signInCubit)),
                      ),
                      SliverToBoxAdapter(child: ForgetPasswordButton()),
                      SliverToBoxAdapter(child: Space(width: 0, height: 20)),
                      SliverToBoxAdapter(
                          child: SingInButton(signInCubit: signInCubit)),
                      SliverToBoxAdapter(child: Space(width: 0, height: 10)),
                      SliverToBoxAdapter(child: IfHaveAccount()),
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
