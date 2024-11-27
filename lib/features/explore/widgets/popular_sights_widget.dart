part of './../../../core/helpers/export_manager/export_manager.dart';

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
