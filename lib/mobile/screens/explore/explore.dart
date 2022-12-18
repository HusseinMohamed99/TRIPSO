import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/colors.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key}) : super(key: key);
  static const String routeName = 'ExploreScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  height: 280,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          AssetPath.gizaImage,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Giza',
                    style: GoogleFonts.roboto(
                      fontSize: 50,
                      fontWeight: FontWeight.w500,
                      color: secondaryColor,
                    ),
                  ),
                ),
                Positioned(
                    top: 13,
                    right: 17,
                    child: Card(
                      elevation: 2,
                      color: secondaryColor,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: const StadiumBorder(
                          side: BorderSide(color: secondaryColor)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 28,
                          )),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 65,
                          height: 63,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(216, 119, 119, 0.15),
                            borderRadius: BorderRadius.all(Radius.circular(19)),
                          ),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 28,
                                  color: Color(0xffD87777),
                                )),
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
                        Container(
                          alignment: Alignment.center,
                          width: 65,
                          height: 63,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(105, 155, 247, 0.15),
                            borderRadius: BorderRadius.all(Radius.circular(19)),
                          ),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.flag,
                                  size: 28,
                                  color: Color(0xff699BF7),
                                )),
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
                        Container(
                          alignment: Alignment.center,
                          width: 65,
                          height: 63,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(133, 84, 150, 0.15),
                            borderRadius: BorderRadius.all(Radius.circular(19)),
                          ),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.transparent,
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 28,
                                  color: Color(0xff855496),
                                )),
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Top Plans',
                  style: GoogleFonts.roboto(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 155,
              child: Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, _) {
                      return listOfPlans();
                    },
                    separatorBuilder: (context, _) {
                      return const Space(height: 0, width: 0);
                    },
                    itemCount: 6),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget listOfPlans() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 155,
                width: 270,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AssetPath.gizaImage,
                      ),
                    )),
              ),
              const LayerImage(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.calendar_month_rounded,
                              size: 27,
                              color: secondaryColor,
                            )),
                        Text(
                          '3 Days',
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_red_eye_outlined,
                              size: 27,
                              color: secondaryColor,
                            )),
                        Text(
                          '25 Sights',
                          style: GoogleFonts.roboto(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ]),
      );
}
