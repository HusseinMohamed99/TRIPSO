import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/mobile/screens/plans/top_plans.dart';
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
      padding: EdgeInsets.only(left: 16.r, right: 16.r),
      child: Column(children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              height: 270.h,
              width: 300.w,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        //  cityModel.image,
                        'https://img.freepik.com/free-photo/flag-palestine_1401-194.jpg?w=996&t=st=1675691524~exp=1675692124~hmac=5198490804e8153abeb25917a4d16695d84e1904eb6eec723b9b92d13fd363b4'),
                  )),
            ),
            LayerImage(
              height: 270.h,
              width: 300.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0.r, horizontal: 5.r),
              child: Row(
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.calendar_month_rounded,
                            size: 27.sp,
                            color: secondaryColor,
                          )),
                      Text('3 Days',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: secondaryColor)),
                    ],
                  ),
                  Space(height: 0.h, width: 10.w),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                            size: 27.sp,
                            color: secondaryColor,
                          )),
                      Text('25 Sights',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: secondaryColor)),
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
