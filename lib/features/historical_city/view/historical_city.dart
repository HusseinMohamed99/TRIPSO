import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tripso/core/helpers/export_manager/export_manager.dart';
import 'package:tripso/model/city_model.dart';
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
            CustomCachedNetworkImage(
              image: argument.image,
              imageHeight: 500,
            ),
            Positioned(
              top: 280.h,
              child: CityAndCountryTitle(
                cityTitle: argument.name,
                countryTitle: argument.country,
              ).hPadding(20),
            ),
            HistoricalCityDescription(
              historical: argument.history,
            ),
          ],
        ),
        Positioned(
          top: 30.h,
          left: 10.w,
          child: CustomArrowBack(),
        ),
        Positioned(
          right: 10.h,
          top: 360.h,
          child: CustomAudioSpeaking(voidCallback: () {
            speak(argument.history);
          }),
        ),
      ],
    );
  }
}
