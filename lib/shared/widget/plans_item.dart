import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/mobile/screens/top_plans/top_plans.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/styles/colors.dart';

Widget topPlansItem(BuildContext context, CityModel cityModel) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
      print(cityModel.name);
      print(cityModel.cId);
      print(cityModel.image);
      navigateTo(context, routeName: TopPlansScreen.routeName);
    },
    child: Padding(
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
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      cityModel.image,
                    ),
                  )),
              ),
              const LayerImage(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
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
                            height: 0.2,
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
                            height: 0.2,
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
      ),
    );
  }
