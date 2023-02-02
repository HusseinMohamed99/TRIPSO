import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/mobile/screens/password/update_password_screen.dart';
import 'package:tripso/shared/adaptive/dialog.dart';
import 'package:tripso/shared/components/my_divider.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/components/log_out.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({Key? key}) : super(key: key);
  static const String routeName = 'MyProfile';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tripsoCubit = TripsoCubit.get(context).userModel;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    maxRadius: 50,
                    minRadius: 50,
                    backgroundImage: AssetImage(tripsoCubit!.image),
                  ),
                  const Space(height: 0, width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tripsoCubit.firstName + tripsoCubit.lastName,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                      const Space(height: 5, width: 0),
                      Text(
                        tripsoCubit.email,
                        style: GoogleFonts.roboto(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Space(height: 30, width: 0),
              InkWell(
                onTap: () {
                  print('tapped');
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(105, 155, 247, 0.15),
                          borderRadius: BorderRadius.all(Radius.circular(19)),
                        ),
                        child: const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.edit_outlined,
                            size: 28,
                            color: Color(0xff699BF7),
                          ),
                        ),
                      ),
                      const Space(height: 0, width: 35),
                      Text(
                        'Custom Profile',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              myDivider(),
              InkWell(
                onTap: () {
                  navigateTo(context, routeName: UpdatePassword.routeName);
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 153, 0, 0.1),
                          borderRadius: BorderRadius.all(Radius.circular(19)),
                        ),
                        child: const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.vpn_key_outlined,
                            size: 28,
                            color: Colors.amber,
                          ),
                        ),
                      ),
                      const Space(
                        width: 35,
                        height: 0,
                      ),
                      Text(
                        'Change Password',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              myDivider(),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(0, 0, 0, 0.1),
                          borderRadius: BorderRadius.all(Radius.circular(19)),
                        ),
                        child: const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.delete_forever,
                            size: 28,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Space(
                        width: 35,
                        height: 0,
                      ),
                      Text(
                        'Delete account',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              myDivider(),
              InkWell(
                onTap: () {
                  MyDialog.showMessage(
                    context,
                    'Are you sure logOut?',
                    posActionTitle: 'Yes',
                    posAction: () {
                      {
                        MyDialog.showLoadingDialog(context, 'Loading');
                        logOut(context);
                        MyDialog.showLoadingDialog(context, 'Loading');
                        MyDialog.hideDialog(context);
                      }
                      MyDialog.hideDialog(context);
                    },
                    negActionTitle: 'Cancel',
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 60,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(247, 21, 21, 0.1),
                          borderRadius: BorderRadius.all(Radius.circular(19)),
                        ),
                        child: const CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.transparent,
                          child: Icon(
                            Icons.logout,
                            size: 28,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      const Space(
                        width: 35,
                        height: 0,
                      ),
                      Text(
                        'Log out',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
