import 'package:flutter/material.dart';
import 'package:tripso/mobile/screens/popular_sights/popular_sights.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/styles/colors.dart';

const List<Icon> iconStar = [
  Icon(
    Icons.star,
    color: Colors.blue,
    size: 20,
  ),
  Icon(
    Icons.star,
    color: Colors.blue,
    size: 20,
  ),
  Icon(
    Icons.star,
    color: Colors.blue,
    size: 20,
  ),
  Icon(
    Icons.star,
    color: Colors.blue,
    size: 20,
  ),
  Icon(
    Icons.star,
    color: Colors.blue,
    size: 20,
  ),
];

Widget gridItemSights(BuildContext context, CityModel cityModel) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
      navigateTo(context, routeName: PopularSightsScreen.routeName);
    },
    child: Stack(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: [
        Card(
          elevation: 6,
          color: secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image: NetworkImage(
                        cityModel.image,
                      ),
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const LayerImage(
                    height: 100,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cityModel.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    Row(
                      children: iconStar,
                    ),
                    Text(
                      'One of the seven Wonders of the World: you can enter a 4,575 years old pyramid'
                          .trim(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 10,
          right: 15,
          child: Column(
            children: [
              const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 26,
              ),
              Text(
                '3 Days',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                      color: secondaryColor,
                    ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
