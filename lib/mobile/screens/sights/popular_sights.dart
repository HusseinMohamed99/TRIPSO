import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/mobile/screens/sights/sight_details_screen.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/speak.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/theme.dart';

class PopularSightsScreen extends StatelessWidget {
  const PopularSightsScreen({
    Key? key,
  }) : super(key: key);

  static const String routeName = 'PopularSightsScreen';

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
                  PopularSightsWidget(
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

class PopularSightsWidget extends StatelessWidget {
  const PopularSightsWidget({
    Key? key,
    required this.cityModel,
    required this.placeModel,
  }) : super(key: key);

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
    Key? key,
    required this.cubit,
  }) : super(key: key);

  final TripsoCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.separated(
          itemBuilder: (context, index) {
            return GridSights(placeModel: cubit.popularPlace[index]);
          },
          separatorBuilder: (context, index) {
            return Space(height: 10.h, width: 0.w);
          },
          itemCount: cubit.popularPlace.length,
        ),
        Positioned(
            top: 10.sp,
            left: 10.sp,
            child: Card(
              elevation: 2,
              color: Colors.black.withOpacity(0.5),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const StadiumBorder(
                  side: BorderSide(color: ThemeApp.secondaryColor)),
              child: IconButton(
                onPressed: () async {
                  if (Navigator.canPop(context)) {
                    pop(context);
                  }
                  await flutterTts.pause();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: ThemeApp.secondaryColor,
                ),
              ),
            )),
      ],
    );
  }
}

class GridSights extends StatelessWidget {
  const GridSights({
    Key? key,
    required this.placeModel,
  }) : super(key: key);

  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        navigateTo(
          context,
          routeName: SightDetailsScreen.routeName,
          arguments: PlaceModel(
            isPopular: placeModel.isPopular,
            history: placeModel.history,
            image: placeModel.image,
            name: placeModel.name,
            address: placeModel.address,
            tickets: placeModel.tickets,
            location: placeModel.location,
            timeOfDay: placeModel.timeOfDay,
            pId: placeModel.pId,
            popular: placeModel.popular,
          ),
        );
      },
      child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Card(
            elevation: 6,
            color: ThemeApp.secondaryColor,
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
                      child: Image(
                        image: NetworkImage(
                          placeModel.image,
                        ),
                        height: 225.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    LayerImage(
                      height: 225.h,
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
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Space(height: 8.h, width: 0.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            placeModel.history.trim(),
                            maxLines: 5,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: Colors.black54),
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
