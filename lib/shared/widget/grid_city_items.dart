import 'package:flutter/material.dart';
import 'package:tripso/model/city_model.dart';

Widget gridCitiesItem(BuildContext context, CityModel cityModel) {
  return GestureDetector(
    onTap: () {
      print('tapped');
    },
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(cityModel.image),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Text(
          cityModel.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
