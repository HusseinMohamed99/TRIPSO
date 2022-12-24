import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tripso/mobile/screens/all_plans/all_plans.dart';
import 'package:tripso/mobile/screens/description/description.dart';
import 'package:tripso/mobile/screens/search/search_screen.dart';
import 'package:tripso/mobile/screens/sights/sights.dart';
import 'package:tripso/model/weather_model.dart';
import 'package:tripso/shared/provider/weather_provider.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/colors.dart';
import 'package:tripso/shared/widget/grid_item.dart';
import 'package:tripso/shared/widget/plans_item.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  static const String routeName = 'ExploreScreen';

  @override
  Widget build(BuildContext context) {
    CityModel cityModel =
        (ModalRoute.of(context)?.settings.arguments) as CityModel;
    WeatherModel weatherData;
    weatherData = Provider.of<WeatherProvider>(context).weatherData!;
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Stack(
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
                      const LayerImage(
                        height: 250,
                        width: double.infinity,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                      top: 10,
                      left: 10,
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
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.transparent,
                        child: Image.asset(weatherData.getImage()),
                      ),
                      const Space(height: 10, width: 0),
                      Text(
                        cityModel.name,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: secondaryColor),
                      ),
                      Text(
                        weatherData.weatherStateName,
                        style: const TextStyle(
                          color: secondaryColor,
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Space(height: 10, width: 0),
                      Text(
                        '${weatherData.temp.toInt().toString()}°',
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            ?.copyWith(color: secondaryColor),
                      ),
                    ],
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
                          Text('Historical',
                              style: Theme.of(context).textTheme.headline4),
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
                          Text('Plans',
                              style: Theme.of(context).textTheme.headline4),
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
                          Text('Sights',
                              style: Theme.of(context).textTheme.headline4),
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
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.blueAccent),
                      )),
                ),
              ),
              const Space(height: 20, width: 0),
              const PopularSightsWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10,
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
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.blueAccent),
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
          padding: const EdgeInsets.only(bottom: 8.0, left: 16, top: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child:
                Text('Top Plans', style: Theme.of(context).textTheme.headline2),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return topPlansItem(context, cubit.city[index]);
              },
              separatorBuilder: (context, _) {
                return const Space(height: 0, width: 0);
              },
              itemCount: cubit.city.length - 15),
        ),
      ],
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
          padding: const EdgeInsets.only(bottom: 8.0, left: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Popular Sights',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        ),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 6.0,
          mainAxisSpacing: 10,
          childAspectRatio: 1 / 1.25,
          children: List.generate(
            cubit.city.length - 10,
            (index) => gridItemSights(context, cubit.city[index]),
          ),
        ),
      ],
    );
  }
}
