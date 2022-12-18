import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tripso/shared/components/app_bar.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'home_layout';

  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = TripsoCubit.get(context).userModel!;
        var tripsoCubit = TripsoCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: thirdAppBar(),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(.1),
                  )
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                    rippleColor: primaryColor,
                    hoverColor: primaryColor,
                    gap: 8,
                    activeColor: Colors.black,
                    iconSize: 24,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                    duration: const Duration(milliseconds: 400),
                    tabBackgroundColor: Colors.grey[100]!,
                    color: Colors.black,
                    tabs: [
                      GButton(
                        icon: Icons.home,
                        text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      ),
                      GButton(
                        icon: Icons.favorite_border,
                        text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      ),
                      GButton(
                        icon: Icons.map_outlined,
                        text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      ),
                      GButton(
                        icon: Icons.person,
                        leading: CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(userModel.image),
                        ),
                        text: tripsoCubit.titles[tripsoCubit.currentIndex],
                      ),
                    ],
                    selectedIndex: tripsoCubit.currentIndex,
                    onTabChange: (index) {
                      tripsoCubit.changeIndex(index);
                    },
                  ),
                ),
              ),
            ),

            // BottomNavigationBar(
            //   currentIndex: index,
            //   onTap: (index){},
            //   items:
            //   const [
            //     BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.black,),label: ''),
            //     BottomNavigationBarItem(icon: Icon(Icons.add),label: 'home'),
            //     BottomNavigationBarItem(icon: Icon(Icons.add),label: 'home'),
            //     BottomNavigationBarItem(icon: Icon(Icons.add),label: 'home'),
            //   ],
            // ),
            body: tripsoCubit.screens[tripsoCubit.currentIndex],
          ),
        );
      },
    );
  }
}
