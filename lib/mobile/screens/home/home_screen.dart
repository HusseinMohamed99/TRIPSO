import 'package:flutter/material.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/widget/grid_city_items.dart';
import '../../../shared/cubit/tripsoCubit/tripso_cubit.dart';
import '../search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = TripsoCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              child:
                  Stack(alignment: AlignmentDirectional.bottomStart, children: [
                const Image(
                  image: AssetImage(AssetPath.dubaiImage),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 60),
                  child: Text(
                    'Where do you \n want to go ?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 205,
                  left: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      // color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: 350,
                    height: 50,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SearchScreen()));
                      },
                      child: Card(
                        elevation: 2,
                        color: const Color(0xffFFFFFF),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SearchScreen()));
                                },
                                icon: const Icon(
                                  Icons.search,
                                  size: 28,
                                  color: Color(0xff595959),
                                )),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Search here',
                              style: TextStyle(
                                color: Color(0xff595959),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            const Space(height: 30, width: 0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Destinations',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),
                ],
              ),
            ),
            GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 6.0,
              mainAxisSpacing: 0,
              childAspectRatio: 5 / 6,
              children: List.generate(
                cubit.city.length,
                (index) => gridCitiesItem(context, cubit.city[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
