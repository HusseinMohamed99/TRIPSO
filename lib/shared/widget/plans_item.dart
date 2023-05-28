import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/mobile/screens/plans/top_plans.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/theme.dart';

class TopPlanItem extends StatelessWidget {
  const TopPlanItem({
    Key? key,
    required this.bestPLanModel,
    required this.cityModel,
    required this.placeModel,
  }) : super(key: key);

  final CityModel cityModel;
  final PlaceModel placeModel;
  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          borderRadius: BorderRadius.circular(20).r,
          onTap: () async {
            TripsoCubit.get(context).getAllBestPlan(cityModel.cId);
            navigateTo(
              context,
              routeName: TopPlansScreen.routeName,
              arguments: ScreenArgs(
                cityModel: cityModel,
                placeModel: placeModel,
                bestPLanModel: bestPLanModel,
              ),
            );
            if (kDebugMode) {
              print(bestPLanModel.pId);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16).r,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 200.h,
                  width: 220.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      const Radius.circular(20).r,
                    ),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/2021884.jpg'),
                    ),
                  ),
                ),
                LayerImage(
                  height: 200.h,
                  width: 220.w,
                ),
                Text(
                  bestPLanModel.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: ThemeApp.blackPrimary),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
