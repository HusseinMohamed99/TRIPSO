import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/features/sights/sight_details_screen.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/speak.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class SightsScreen extends StatelessWidget {
  const SightsScreen({
    super.key,
  });

  static const String routeName = 'SightsScreen';

  @override
  Widget build(BuildContext context) {
    ScreenArgs screenArgs =
        ModalRoute.of(context)!.settings.arguments as ScreenArgs;
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0.r),
              child: Column(
                children: [
                  SightsWidget(
                      cityModel: screenArgs.cityModel,
                      placeModel: screenArgs.placeModel)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class SightsWidget extends StatelessWidget {
  const SightsWidget({
    super.key,
    required this.cityModel,
    required this.placeModel,
  });

  final CityModel cityModel;
  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Expanded(child: ListViewWidget(cubit: cubit));
      },
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({
    super.key,
    required this.cubit,
  });

  final TripsoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          itemBuilder: (context, index) {
            return GridSights(
                placeModel: cubit.place[index],
                cubit.cityModel!,
                cubit.bestPLanModel!);
          },
          separatorBuilder: (context, index) {
            return Space(height: 10.h, width: 0.w);
          },
          itemCount: cubit.place.length,
        ),
        Positioned(
            top: 10.sp,
            left: 10.sp,
            child: Card(
              elevation: 2,
              color: Colors.black.withOpacity(0.5),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const StadiumBorder(
                  side: BorderSide(color: ColorsManager.secondaryColor)),
              child: IconButton(
                onPressed: () async {
                  if (Navigator.canPop(context)) {
                    pop(context);
                  }
                  await flutterTts.pause();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorsManager.secondaryColor,
                ),
              ),
            )),
      ],
    );
  }
}

class GridSights extends StatelessWidget {
  const GridSights(
    this.cityModel,
    this.bestPLanModel, {
    super.key,
    required this.placeModel,
  });

  final PlaceModel placeModel;
  final CityModel cityModel;
  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        navigateTo(
          context,
          routeName: SightDetailsScreen.routeName,
          arguments: ScreenArgs(
              placeModel: placeModel,
              cityModel: cityModel,
              bestPLanModel: bestPLanModel),
        );
      },
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Card(
            elevation: 6,
            color: ColorsManager.secondaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: CachedNetworkImage(
                        imageUrl: placeModel.image,
                        fit: BoxFit.fill,
                        height: 180.h,
                        width: double.infinity,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: AdaptiveIndicator(os: getOs()),
                        ),
                        errorWidget: (context, url, error) => Center(
                          child: AdaptiveIndicator(os: getOs()),
                        ),
                      ),
                    ),
                    LayerImage(
                      height: 180.h,
                      width: double.infinity,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        placeModel.name.trim(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Space(height: 8.h, width: 0.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            placeModel.history.trim(),
                            maxLines: 4,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: Colors.black54,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}