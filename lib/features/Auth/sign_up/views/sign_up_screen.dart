import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/core/styles/asset_path.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/toast.dart';
import 'package:tripso/shared/cubit/SignUpCubit/sign_up_state.dart';
import 'package:tripso/shared/cubit/signUpCubit/sign_up_cubit.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'sign_up_screen';

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpCubit>();
    return BlocConsumer<SignUpCubit, SignUpStates>(listener: (context, state) {
      if (state is SignUpSuccessState) {
        MyDialog.showLoadingDialog(context, 'SignUp is successfully');
      }
      if (state is UserCreateSuccessState) {
        showToast(text: 'Sign Up Successfully', state: ToastStates.success);
        // MyDialog.showLoadingDialog(context, 'SignUp is successfully');
        // CacheHelper.saveData(value: state.uid, key: 'uId').then((value) {
        //   uId = state.uid;
        //   TripsoCubit.get(context).getUserData();
        //   navigateAndFinish(context, routeName: CitiesScreen.routeName);
        // });
      } else if (state is SignUpErrorState) {
        MyDialog.showLoadingDialog(context, 'SignUp is Error');
        MyDialog.hideDialog(context);
        MyDialog.showMessage(
          context,
          state.error,
          negActionTitle: 'Cancel',
          negAction: () {
            Navigator.pop(context);
          },
        );
      }
    }, builder: (context, state) {
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
                    SliverToBoxAdapter(child: Space(width: 0, height: 20)),
                    SliverToBoxAdapter(
                        child: SignUpButton(signUpCubit: signUpCubit)),
                  ],
                ).allPadding(hPadding: 20),
              ),
            ),
          ),
        ),
      );
    });
  }
}
