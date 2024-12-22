import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/components/speak.dart';

class HistoricalCity extends StatelessWidget {
  const HistoricalCity({super.key, required this.argument});
  final CityModel argument;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 500.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(20).r,
                    bottomRight: const Radius.circular(20).r,
                  ),
                ),
                child: CustomCachedNetworkImage(
                  image: argument.image,
                  imageHeight: 500,
                )),
            Positioned(
              top: 280.h,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      argument.name,
                      style: context.headlineSmall?.copyWith(
                        color: ColorsManager.whiteColor,
                      ),
                    ),
                    Space(height: 10, width: 0),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorsManager.primaryColor,
                          size: 30.sp,
                        ),
                        Text(
                          argument.country.trim(),
                          style: context.titleLarge?.copyWith(
                            color: ColorsManager.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            HistoricalCityDescription(
              historical: argument.history.trim(),
            ),
          ],
        ),
        Positioned(
          top: 30.h,
          left: 10.w,
          child: Card(
            elevation: 2,
            color: ColorsManager.blackPrimary.withOpacity(0.5),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const StadiumBorder(
              side: BorderSide(color: ColorsManager.whiteColor),
            ),
            child: IconButton(
              onPressed: () async {
                if (Navigator.canPop(context)) {
                  context.pop();
                }
                await flutterTts.pause();
              },
              icon: Icon(
                Icons.arrow_back,
                color: ColorsManager.whiteColor,
                size: 24.sp,
              ),
            ),
          ),
        ),
        Positioned(
          right: 10.h,
          top: 360.h,
          child: Card(
            elevation: 2,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: const StadiumBorder(
              side: BorderSide(
                color: ColorsManager.whiteColor,
              ),
            ),
            child: CircleAvatar(
              radius: 30.r,
              backgroundColor: ColorsManager.whiteColor,
              child: IconButton(
                onPressed: () {
                  speak(argument.history);
                },
                icon: Icon(
                  Icons.record_voice_over,
                  color: ColorsManager.primaryColor,
                  size: 30.sp,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
