import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/features/plans/create_customize_plan.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
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
        return Column(
          children: [
            CityDetails(
              tripsoCubit: tripsoCubit,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: RowWidget(
                      tripsoCubit: tripsoCubit,
                    ),
                  ),
                  SliverToBoxAdapter(child: PopularSightsWidget()),
                  SliverToBoxAdapter(child: const TopPlansWidget()),
                ],
              ),
            ),
          ],
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
        CachedNetworkImage(
          imageUrl: tripsoCubit.cityModel?.image ?? '',
          fit: BoxFit.fitHeight,
          height: context.height * 0.3,
          width: double.infinity,
          errorWidget: (context, url, error) => Icon(
            Icons.info,
            size: 24.sp,
          ),
        ),
        LayerImage(
          height: context.height * 0.3,
          width: double.infinity,
          borderRadius: BorderRadius.zero,
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
        width: double.infinity,
        padding: const EdgeInsets.all(10).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFeatureTile(
              context: context,
              onTap: () {
                // Uncomment and implement navigation logic
                // navigateTo(context, routeName: HistoricalCity.routeName, arguments: CityModel(...));
              },
              icon: Icons.book_outlined,
              iconColor: const Color.fromARGB(255, 216, 119, 119),
              backgroundColor: const Color.fromRGBO(216, 119, 119, 0.15),
              label: 'Historical',
            ),
            Space(height: 0, width: 10),
            _buildFeatureTile(
              context: context,
              onTap: () {
                navigateTo(context, routeName: CreateCustomizePlan.routeName);
              },
              icon: Icons.dashboard_customize_outlined,
              iconColor: const Color.fromARGB(255, 105, 155, 247),
              backgroundColor: const Color.fromRGBO(105, 155, 247, 0.15),
              label: 'Plans',
            ),
            Space(height: 0, width: 10),
            _buildFeatureTile(
              context: context,
              onTap: () async {
                // Uncomment and implement navigation logic
                // TripsoCubit.get(context).getDataPlaces(cityModel.cId);
                // navigateTo(context, routeName: SightsScreen.routeName, arguments: ScreenArgs(...));
              },
              icon: Icons.remove_red_eye_outlined,
              iconColor: const Color.fromARGB(255, 133, 84, 150),
              backgroundColor: const Color.fromRGBO(133, 84, 150, 0.15),
              label: 'Sights',
            ),
          ],
        ),
      ),
    );
  }

  /// Builds an individual feature tile with an icon, background, and label.
  Widget _buildFeatureTile({
    required BuildContext context,
    required VoidCallback onTap,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
    required String label,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80.h,
              width: 80.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    backgroundColor.withOpacity(0.8),
                    backgroundColor.withOpacity(0.5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor.withOpacity(0.3),
                    offset: Offset(0, 4),
                    blurRadius: 10.r,
                  ),
                ],
                borderRadius: BorderRadius.circular(20).r,
              ),
              child: CircleAvatar(
                radius: 30.r,
                backgroundColor: Colors.white,
                child: Icon(
                  icon,
                  size: 32.sp,
                  color: iconColor,
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              label,
              textAlign: TextAlign.center,
              style: context.titleSmall?.copyWith(
                fontWeight: FontWeightHelper.semiBold,
                color: ColorsManager.blackPrimary,
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
