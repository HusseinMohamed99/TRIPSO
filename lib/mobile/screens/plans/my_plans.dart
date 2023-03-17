import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/theme.dart';

class MyPlansScreen extends StatelessWidget {
  const MyPlansScreen({Key? key}) : super(key: key);
  static const String routeName = 'MyPlans';

  @override
  Widget build(BuildContext context) {
    var tripsoCubit = TripsoCubit.get(context).cityModel;
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 200.w,
                    height: 220.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18).r,
                      image: const DecorationImage(
                        image: AssetImage(AssetPath.emptyImage),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    'Your ${tripsoCubit!.name} is Empty',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 10.sp,
              left: 10.sp,
              child: Card(
                elevation: 2,
                color: Colors.black.withOpacity(0.5),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: ThemeApp.secondaryColor,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      pop(context);
                      cubit.currentIndex = 0;
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: ThemeApp.secondaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
