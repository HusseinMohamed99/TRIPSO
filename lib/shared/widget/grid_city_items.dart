import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tripso/layout/layout.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/styles/colors.dart';

Widget gridCitiesItem(BuildContext context, CityModel cityModel) {
  return InkWell(
    borderRadius: BorderRadius.circular(10),
    onTap: () {
      navigateTo(context,
          routeName: HomeLayout.routeName,
          arguments: CityModel(
              name: cityModel.name,
              cId: cityModel.cId,
              image: cityModel.image));
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 180,
          height: 170,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(cityModel.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        const LayerImage(
          width: 180,
          height: 170,
        ),
        Text(
          cityModel.name,
          style: GoogleFonts.roboto(
            color: secondaryColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
