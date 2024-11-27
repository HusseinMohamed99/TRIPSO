import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/features/historical_city/historical_city.dart';
import 'package:tripso/features/plans/create_customize_plan.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/widget/grid_item.dart';
import 'package:tripso/shared/widget/plans_item.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tripsoCubit = context.read<TripsoCubit>();

    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CityDetails(
                tripsoCubit: tripsoCubit,
              ),
              RowWidget(
                tripsoCubit: tripsoCubit,
              ),
              PopularSightsWidget(),
              const TopPlansWidget(),
              //  const AllPlansButton(),
            ],
          ),
        );
      },
    );
  }
}

class CityDetails extends StatelessWidget {
  const CityDetails({
    super.key,
    required this.tripsoCubit,
  });

  final TripsoCubit tripsoCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ).r,
          ),
          child: CachedNetworkImage(
            imageUrl: tripsoCubit.cityModel?.image ?? '',
            fit: BoxFit.cover,
            height: 400.h,
            width: double.infinity,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: AdaptiveIndicator(os: getOs()),
            ),
            errorWidget: (context, url, error) => Icon(
              FontAwesomeIcons.info,
              size: 24.sp,
            ),
          ),
        ),
        LayerImage(
          height: 200.h,
          width: double.infinity,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ).r,
        ),
      ],
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.tripsoCubit,
  });

  final TripsoCubit tripsoCubit;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20).r,
      ),
      elevation: 2,
      margin: const EdgeInsets.all(10).r,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        alignment: Alignment.center,
        height: 150.h,
        width: double.infinity,
        padding: const EdgeInsets.all(10).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        routeName: HistoricalCity.routeName,
                        arguments: CityModel(
                          history: tripsoCubit.cityModel?.history ?? '',
                          name: tripsoCubit.cityModel?.name ?? '',
                          cId: tripsoCubit.cityModel?.cId ?? '',
                          country: tripsoCubit.cityModel?.country ?? '',
                          image: tripsoCubit.cityModel?.image ?? "",
                          isPopular: tripsoCubit.cityModel?.isPopular ?? false,
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(19).r,
                    child: Container(
                      alignment: Alignment.center,
                      width: 70.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(216, 119, 119, 0.15),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(19).r),
                      ),
                      child: CircleAvatar(
                        radius: 22.r,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.book_outlined,
                          size: 28.sp,
                          color: const Color.fromARGB(255, 216, 119, 119),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Historical',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      navigateTo(
                        context,
                        routeName: CreateCustomizePlan.routeName,
                      );
                    },
                    borderRadius: BorderRadius.circular(19).r,
                    child: Container(
                      alignment: Alignment.center,
                      width: 70.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(105, 155, 247, 0.15),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(19).r),
                      ),
                      child: CircleAvatar(
                        radius: 22.r,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.dashboard_customize_outlined,
                          size: 28.sp,
                          color: const Color.fromARGB(255, 105, 155, 247),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Customize Plans',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      // TripsoCubit.get(context).getDataPlaces(cityModel.cId);
                      // TripsoCubit.get(context).fetchCityData(cityModel.cId);
                      // navigateTo(
                      //   context,
                      //   routeName: SightsScreen.routeName,
                      //   arguments: ScreenArgs(
                      //     cityModel: cityModel,
                      //     placeModel: placeModel,
                      //     bestPLanModel: bestPLanModel,
                      //   ),
                      // );
                      // debugPrint('City ID = ${cityModel.cId}');
                    },
                    borderRadius: BorderRadius.circular(19).r,
                    child: Container(
                      alignment: Alignment.center,
                      width: 70.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(133, 84, 150, 0.15),
                        borderRadius:
                            BorderRadius.all(const Radius.circular(19).r),
                      ),
                      child: CircleAvatar(
                        radius: 22.r,
                        backgroundColor: Colors.transparent,
                        child: Icon(
                          Icons.remove_red_eye_outlined,
                          size: 28.sp,
                          color: const Color.fromARGB(255, 133, 84, 150),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Sights',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PopularSightsWidget extends StatelessWidget {
  const PopularSightsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TripsoCubit>();
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Sights',
                    style: GoogleFonts.roboto(
                      fontSize: 19.sp,
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      // TripsoCubit.get(context).getPopularPlace(cityModel.cId);
                      // TripsoCubit.get(context).getDataPlaces(cityModel.cId);
                      // TripsoCubit.get(context).fetchCityData(cityModel.cId);

                      // navigateTo(
                      //   context,
                      //   routeName: PopularSightsScreen.routeName,
                      //   arguments: ScreenArgs(
                      //     cityModel: cityModel,
                      //     placeModel: placeModel,
                      //     bestPLanModel: bestPLanModel,
                      //   ),
                      // );
                      // debugPrint('City ID = ${cityModel.cId}');
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0).r,
                      child: Row(
                        children: [
                          const Text(
                            'See More',
                            style: TextStyle(
                              color: ColorsManager.primaryColor,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.0.sp,
                            color: ColorsManager.primaryColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CarouselSlider(
              items: List.generate(
                  cubit.popularPlace.length,
                  (index) => GridItemSights(
                      cubit.cityModel!, cubit.bestPLanModel!,
                      placeModel: cubit.popularPlace[index])),
              options: CarouselOptions(
                height: 227.h,
                enlargeCenterPage: true,
                disableCenter: true,
                viewportFraction: .7,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
            ),
          ],
        );
      },
    );
  }
}

class TopPlansWidget extends StatelessWidget {
  const TopPlansWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TripsoCubit>();
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0).r,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top Plans',
                    style: GoogleFonts.roboto(
                      fontSize: 19.sp,
                      color: ColorsManager.primaryColor,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: Row(
                      children: [
                        const Text(
                          'See More',
                          style: TextStyle(
                            color: ColorsManager.primaryColor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16.0.sp,
                          color: ColorsManager.primaryColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return TopPlanItem(
                    cityModel: cubit.cityModel!,
                    placeModel: cubit.placeModel!,
                    bestPLanModel: cubit.bestPlan[index],
                  );
                },
                itemCount: cubit.bestPlan.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
