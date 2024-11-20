import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/core/styles/theme.dart';
import 'package:tripso/features/plans/best_plan_details.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';

class TopPlansScreen extends StatelessWidget {
  const TopPlansScreen({super.key});
  static const String routeName = 'TopPlansScreen';

  @override
  Widget build(BuildContext context) {
    ScreenArgs screenArgs =
        ModalRoute.of(context)!.settings.arguments as ScreenArgs;
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff57C7DF),
                Color(0xff66AAB9),
                Color(0xffFFFFFF),
              ],
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                screenArgs.bestPLanModel.name,
                style: GoogleFonts.roboto(
                  color: ThemeApp.secondaryColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: ListOfPlace(
              bestPLanModel: screenArgs.bestPLanModel,
              placeModel: screenArgs.placeModel,
              cityModel: screenArgs.cityModel,
            ),
          ),
        );
      },
    );
  }
}

class ListOfPlace extends StatelessWidget {
  const ListOfPlace({
    super.key,
    required this.bestPLanModel,
    required this.placeModel,
    required this.cityModel,
  });

  final BestPLanModel bestPLanModel;
  final PlaceModel placeModel;
  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Container(
            padding: const EdgeInsets.symmetric(vertical: 60),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: bestPLanModel.days!.map((place) {
                  List<String> text = place.split(", ");
                  return Column(
                    children: [
                      for (var i = 0; i < text.length; i++)
                        Container(
                          margin: const EdgeInsets.all(16),
                          padding: const EdgeInsets.all(14),
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30).r,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  text[i].trim(),
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xFF737373)),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  TripsoCubit.get(context)
                                      .getDataPlaceForBestPlan(
                                          cityModel.cId, text[i].trim());
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (BuildContext context) {
                                    return BestPlanDetailsScreen(
                                      pId: text[i],
                                      cId: cityModel.cId,
                                    );
                                  }));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 75,
                                  height: 30.h,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ThemeApp.primaryColor,
                                  ),
                                  child: Text(
                                    'Details',
                                    style: GoogleFonts.roboto(
                                      color: ThemeApp.secondaryColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  );
                }).toList(),
              ),
            ));
      },
    );
  }
}
