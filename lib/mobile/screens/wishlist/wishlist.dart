import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/asset_path.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);
  static const String routeName = 'WishList';

  @override
  Widget build(BuildContext context) {
    var tripsoCubit = TripsoCubit.get(context).cityModel;
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
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
        );
      },
    );
  }
}
