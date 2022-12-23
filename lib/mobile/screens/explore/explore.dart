import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/mobile/screens/all_plans/all_plans.dart';
import 'package:tripso/mobile/screens/description/description.dart';
import 'package:tripso/mobile/screens/search/search_screen.dart';
import 'package:tripso/mobile/screens/sights/sights.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/colors.dart';
import 'package:tripso/shared/widget/grid_item.dart';
import 'package:tripso/shared/widget/plans_item.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  static const String routeName = 'ExploreScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        CityModel cityModel =
            (ModalRoute.of(context)?.settings.arguments) as CityModel;
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            cityModel.image,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      cityModel.name,
                      style: GoogleFonts.roboto(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 10,
                      right: 10,
                      child: Card(
                        elevation: 2,
                        color: Colors.black.withOpacity(0.5),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: const StadiumBorder(
                            side: BorderSide(color: secondaryColor)),
                        child: IconButton(
                            onPressed: () {
                              navigateTo(context,
                                  routeName: SearchScreen.routeName);
                            },
                            icon: const Icon(
                              Icons.search,
                              size: 28,
                              color: secondaryColor,
                            )),
                      )),
                  Positioned(
                    bottom: 20,
                    right: 40,
                    child: Text(
                      '34°',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                  ),
                  const Positioned(
                    bottom: 60,
                    right: 5,
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image(
                        image: AssetImage(
                          AssetPath.clearImage,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              navigateTo(context,
                                  routeName: DescriptionScreen.routeName);
                            },
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              alignment: Alignment.center,
                              width: 65,
                              height: 63,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(216, 119, 119, 0.15),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(19)),
                              ),
                              child: const CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 28,
                                  color: Color(0xffD87777),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Description',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
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
                              navigateTo(context,
                                  routeName: AllPlansScreen.routeName);
                            },
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              alignment: Alignment.center,
                              width: 65,
                              height: 63,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(105, 155, 247, 0.15),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(19)),
                              ),
                              child: const CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.flag,
                                  size: 28,
                                  color: Color(0xff699BF7),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Plans',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
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
                              navigateTo(context,
                                  routeName: SightsScreen.routeName);
                            },
                            borderRadius: BorderRadius.circular(19),
                            child: Container(
                              alignment: Alignment.center,
                              width: 65,
                              height: 63,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(133, 84, 150, 0.15),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(19)),
                              ),
                              child: const CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.transparent,
                                child: Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 28,
                                  color: Color(0xff855496),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Sights',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const TopPlansWidget(),
              const Space(height: 20, width: 0),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 2.0, color: primaryColor),
                  ),
                  onPressed: () {
                    navigateTo(context, routeName: AllPlansScreen.routeName);
                  },
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'All Plans',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      )),
                ),
              ),
              const Space(height: 20, width: 0),
              const PopularSightsWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(width: 2.0, color: primaryColor),
                  ),
                  onPressed: () {
                    navigateTo(context, routeName: AllPlansScreen.routeName);
                  },
                  child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'All Popular Sights',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.blue,
                        ),
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PopularSightsWidget extends StatelessWidget {
  const PopularSightsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Popular Sights',
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        GridView.count(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 0,
          childAspectRatio: 4 / 6,
          children: List.generate(
            cubit.city.length,
            (index) => gridItemSights(context, cubit.city[index]),
          ),
        ),
      ],
    );
  }
}

class TopPlansWidget extends StatelessWidget {
  const TopPlansWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0, left: 20, top: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Top Plans',
              style: GoogleFonts.roboto(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 155,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return topPlansItem(context, cubit.city[index]);
              },
              separatorBuilder: (context, _) {
                return const Space(height: 0, width: 0);
              },
              itemCount: cubit.city.length),
        ),
      ],
    );
  }
}
