import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/mobile/screens/search/search_screen.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/search_bar.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/colors.dart';
import 'package:tripso/shared/widget/grid_city_items.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: cubit.city.isEmpty
                ? Center(child: AdaptiveIndicator(os: getOs()))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      Container(
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        height: 250,
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20),
                                            ),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                AssetPath.dubaiImage,
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
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, bottom: 50),
                                        child: Text(
                                          'Where do you\nwant to go ?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline1
                                              ?.copyWith(
                                                color: secondaryColor,
                                              ),
                                        ),
                                      ),
                                    ]),
                                const Space(height: 50, width: 0),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Destinations',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                                top: 221,
                                right: 33,
                                left: 33,
                                child: SearchBar(
                                    readOnly: true,
                                    function: () {
                                      navigateTo(context,
                                          routeName: SearchScreen.routeName);
                                    })),
                          ],
                        ),
                        gridICitiesItem(context),
                      ],
                    ),
                  ),
          ),
        );
      },
    );
  }

  Widget gridICitiesItem(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 5,
      childAspectRatio: 1 / 1.2,
      children: List.generate(
        cubit.city.length,
        (index) => gridCitiesItem(context, cubit.city[index]),
      ),
    );
  }
}
