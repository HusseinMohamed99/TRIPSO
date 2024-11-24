part of './../../../../core/helpers/export_manager/export_manager.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return BlocConsumer<SignUpCubit, SignUpStates>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {}
        if (state is UserCreateSuccessState) {
          context.showSnackBar(
            'User Created Successfully',
            color: ColorsManager.greenColor,
          );
        } else if (state is SignUpErrorState) {
          context.showSnackBar(state.error, color: ColorsManager.redColor);
        }
      },
      builder: (context, state) {
        return Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssetPath.signUPImage),
              fit: BoxFit.fill,
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(
                width: double.infinity,
                height: context.height * .9,
                child: Form(
                  key: signUpCubit.formKey,
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Center(
                          child: SignUpInputField(signUpCubit: signUpCubit),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Space(width: 0, height: 20),
                      ),
                      SliverToBoxAdapter(
                        child: SignUpButton(signUpCubit: signUpCubit),
                      ),
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
