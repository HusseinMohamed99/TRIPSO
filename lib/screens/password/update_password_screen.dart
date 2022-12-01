import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../shared/animation/fade_animation.dart';
import '../../shared/components/buttons.dart';
import '../../shared/components/navigator.dart';
import '../../shared/components/sized_box.dart';
import '../../shared/components/text_form_field.dart';
import '../../shared/cubit/tripsoCubit/tripso_cubit.dart';
import '../../shared/cubit/tripsoCubit/tripso_state.dart';
import '../../shared/styles/colors.dart';
import '../../shared/styles/asset_path.dart';
import '../sign_in/sign_in_screen.dart';

class UpdatePassword extends StatelessWidget {
  static const String routeName = 'update_password_screen';
  const UpdatePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var newPasswordController = TextEditingController();
    var confirmationPasswordController = TextEditingController();

    return BlocConsumer<TripsoCubit, TripsoStates>(listener: (context, state) {
      if (state is ChangeUserPasswordSuccessState) {
        navigateAndFinish(context,routeName: SignInScreen.routeName);
      }
    }, builder: (context, state) {
      var updatePasswordKey = GlobalKey<FormState>();
      var cubit = TripsoCubit.get(context);
      return PlatformScaffold(
        appBar:PlatformAppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              newPasswordController.clear();
              confirmationPasswordController.clear();
              pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),

          title: Text(
            'New Password',
            style: GoogleFonts.roboto(
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),



          material: (context, __)  => MaterialAppBarData(
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            elevation: 0,
            titleSpacing: 1,
          ),
          cupertino: (context, __) => CupertinoNavigationBarData(
            brightness: Brightness.dark,
          ),
        ),
        body: Form(
          key: updatePasswordKey,
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  space(width: 0, height: 25),
                  title(),
                  assetImage(),
                  space(width: 0, height: 60),
                  PasswordFormField(
                      newPasswordController: newPasswordController,
                      confirmationPasswordController:
                          confirmationPasswordController,
                      cubit: cubit),
                  space(width: 0, height: 50),
                  buildDefaultButton(updatePasswordKey, cubit,
                      newPasswordController, confirmationPasswordController)
                ],
              ),
            ),
          ]),
        ),
      );
    });
  }

  Widget buildDefaultButton(
          GlobalKey<FormState> updatePasswordKey,
          TripsoCubit cubit,
          TextEditingController newPasswordController,
          TextEditingController confirmationPasswordController) =>
      defaultButton(
        color: primaryColor,
        widget: Text(
          'Change Password',
          textAlign: TextAlign.center,
          style: GoogleFonts.roboto(
            fontSize: 19,
            color: const Color(0xffFFFFFF),
            fontWeight: FontWeight.w500,
          ),
        ),
        function: () {
          if (updatePasswordKey.currentState!.validate()) {
            cubit.changeUserPassword(
              password: newPasswordController.text,
            );
            newPasswordController.clear();
            confirmationPasswordController.clear();
          }
        },
      );

  Widget title() => FittedBox(
        child: Column(
          children: [
            Text(
              'Create New Password?',
              style: GoogleFonts.roboto(
                  color: primaryColor,
                  fontSize: 25,
                  fontWeight: FontWeight.w500),
            ),
            space(width: 0, height: 10),
            Text(
              'Your new password must be different\n'
              '         from previous used password',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      );

  Widget assetImage() => const FadeAnimation(
        1.0,
        child: Image(
            height: 300, image: AssetImage(AssetPath.changePasswordImage)),
      );
}

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    Key? key,
    required this.newPasswordController,
    required this.confirmationPasswordController,
    required this.cubit,
  }) : super(key: key);

  final TextEditingController newPasswordController;
  final TextEditingController confirmationPasswordController;
  final TripsoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          defaultTextFormField(
            color: Colors.grey.shade400,
            context: context,
            controller: newPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscuringCharacter: '*',
            validate: (String? value) {
              if (value!.isEmpty) {
                return 'Password is Required';
              }
              if (value != confirmationPasswordController.text) {
                return ' Password is not the same';
              }
              return null;
            },
            prefix: Icons.lock_outline_sharp,
            suffix: cubit.suffix,
            isPassword: cubit.isPassword,
            suffixPressed: () {
              cubit.showPassword();
            },
            hint: 'Password',
          ),
          space(width: 0, height: 30),
          defaultTextFormField(
            color: Colors.grey.shade400,
            context: context,
            controller: confirmationPasswordController,
            keyboardType: TextInputType.visiblePassword,
            obscuringCharacter: '*',
            validate: (value) {
              if (value!.isEmpty) {
                return 'Password is Required';
              }
              if (value != newPasswordController.text) {
                return ' Password is not the same';
              }
              return null;
            },
            prefix: Icons.lock_outline_sharp,
            suffix: cubit.suffix,
            isPassword: cubit.isPassword,
            suffixPressed: () {
              cubit.showPassword();
            },
            hint: 'Confirm Password',
          )
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// import 'auth.dart';
//
// class UpdatePassword extends StatefulWidget {
//   const UpdatePassword({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _UpdatePasswordState createState() => _UpdatePasswordState();
// }
//
// class _UpdatePasswordState extends State<UpdatePassword> {
//   final TextEditingController _passController = TextEditingController();
//
//   final TextEditingController _confirmPassController = TextEditingController();
//
//   Future<void> _submit(String newPassword) async {
//     await AuthServices().changePassword(newPassword);
//   }

