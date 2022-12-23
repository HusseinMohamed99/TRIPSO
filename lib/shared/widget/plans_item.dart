import 'package:flutter/material.dart';
import 'package:tripso/mobile/screens/top_plans/top_plans.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/styles/colors.dart';

Widget topPlansItem(BuildContext context, CityModel cityModel) {
  return InkWell(
    borderRadius: BorderRadius.circular(20),
    onTap: () {
      navigateTo(context, routeName: TopPlansScreen.routeName);
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 16,right: 16),
      child: Column(children: [
        Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 150,
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
               const LayerImage(height: 150,),
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
                          style: Theme.of(context).textTheme.subtitle1?.copyWith(color: secondaryColor)
                        ),
                      ],
                    ),
                    const   Space(height: 0, width: 5),
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
                           style: Theme.of(context).textTheme.subtitle1?.copyWith(color: secondaryColor)
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
