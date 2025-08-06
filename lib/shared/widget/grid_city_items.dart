import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tripso/layout/layout.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/layer.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/provider/weather_provider.dart';
import 'package:tripso/shared/service/weather_service.dart';
import 'package:tripso/shared/styles/theme.dart';

class GridCitiesItem extends StatelessWidget {
  const GridCitiesItem(
    this.placeModel,
    this.bestPLanModel, {
    super.key,
    required this.cityModel,
  });

  final CityModel cityModel;
  final PlaceModel placeModel;
  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        final cubit = TripsoCubit.get(context);

        // استدعاءات متزامنة قبل أي await
        cubit.getUserData();
        cubit.getDataPlaces(cityModel.cId);
        cubit.getPopularPlace(cityModel.cId);
        cubit.getDataForCity(cityModel.cId);
        cubit.getAllBestPlan(cityModel.cId);

        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(
            cityModel: cityModel,
            placeModel: placeModel,
            bestPLanModel: bestPLanModel,
          ),
        );

        debugPrint('City ID = ${cityModel.cId}');

        // async gap يبدأ هنا 👇
        final weather = await WeatherService().getWeather(
          cityName: cityModel.name,
        );

        // ✅ تحقق أن الـ context لسه موجود
        if (!context.mounted) return;

        final weatherProvider = Provider.of<WeatherProvider>(
          context,
          listen: false,
        );
        weatherProvider.cityName = cityModel.name;
        weatherProvider.weatherData = weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: ThemeApp.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)).r,
                child: CachedNetworkImage(
                  imageUrl: cityModel.image,
                  fit: BoxFit.fill,
                  height: 200.h,
                  width: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: AdaptiveIndicator(os: getOs())),
                  errorWidget: (context, url, error) =>
                      Icon(FontAwesomeIcons.info, size: 30.sp),
                ),
              ),
            ),
            LayerImage(width: 200.w, height: 210.h),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ThemeApp.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridEGItem extends StatelessWidget {
  const GridEGItem(
    this.placeModel,
    this.bestPLanModel, {
    super.key,
    required this.cityModel,
  });

  final CityModel cityModel;
  final PlaceModel placeModel;
  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        final cubit = TripsoCubit.get(context);

        cubit.getUserData();
        cubit.getDataPlaces(cityModel.cId);
        cubit.getPopularPlace(cityModel.cId);
        cubit.getDataForCity(cityModel.cId);
        cubit.getAllBestPlan(cityModel.cId);

        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(
            cityModel: cityModel,
            placeModel: placeModel,
            bestPLanModel: bestPLanModel,
          ),
        );

        debugPrint('City ID = ${cityModel.cId}');

        final service = WeatherService();
        final weather = await service.getWeather(cityName: cityModel.name);

        if (!context.mounted) return; // ✅ تأكد من أن الـ context ما زال موجودًا

        final weatherProvider = Provider.of<WeatherProvider>(
          context,
          listen: false,
        );
        weatherProvider.cityName = cityModel.name;
        weatherProvider.weatherData = weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: ThemeApp.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(const Radius.circular(20).r).r,
                child: CachedNetworkImage(
                  imageUrl: cityModel.image,
                  fit: BoxFit.fill,
                  height: 200.h,
                  width: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: AdaptiveIndicator(os: getOs())),
                  errorWidget: (context, url, error) =>
                      Icon(FontAwesomeIcons.info, size: 30.sp),
                ),
              ),
            ),
            LayerImage(width: 200.w, height: 210.h),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ThemeApp.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridITItem extends StatelessWidget {
  const GridITItem(
    this.placeModel,
    this.bestPLanModel, {
    super.key,
    required this.cityModel,
  });

  final CityModel cityModel;
  final PlaceModel placeModel;
  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        final cubit = TripsoCubit.get(context);
        final weatherProvider = Provider.of<WeatherProvider>(
          context,
          listen: false,
        );

        // تحميل البيانات المتزامنة
        cubit.getUserData();
        cubit.getDataPlaces(cityModel.cId);
        cubit.getPopularPlace(cityModel.cId);
        cubit.getDataForCity(cityModel.cId);
        cubit.getAllBestPlan(cityModel.cId);

        // الانتقال للشاشة التالية مباشرة
        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(
            cityModel: cityModel,
            placeModel: placeModel,
            bestPLanModel: bestPLanModel,
          ),
        );

        debugPrint('City ID = ${cityModel.cId}');

        // تحميل بيانات الطقس بعد الانتقال
        final weather = await WeatherService().getWeather(
          cityName: cityModel.name,
        );

        if (!context.mounted) return; // ✅ منع استخدام context بعد await

        weatherProvider.cityName = cityModel.name;
        weatherProvider.weatherData = weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: ThemeApp.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)).r,
                child: CachedNetworkImage(
                  imageUrl: cityModel.image,
                  fit: BoxFit.fill,
                  height: 200.h,
                  width: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: AdaptiveIndicator(os: getOs())),
                  errorWidget: (context, url, error) =>
                      Icon(FontAwesomeIcons.info, size: 30.sp),
                ),
              ),
            ),
            LayerImage(width: 200.w, height: 210.h),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ThemeApp.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridUAEItem extends StatelessWidget {
  const GridUAEItem(
    this.placeModel,
    this.bestPLanModel, {
    super.key,
    required this.cityModel,
  });

  final CityModel cityModel;
  final PlaceModel placeModel;
  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        final cubit = TripsoCubit.get(context);
        final weatherProvider = Provider.of<WeatherProvider>(
          context,
          listen: false,
        );

        // ✅ تحميل البيانات المرتبطة بالمدينة
        cubit.getUserData();
        cubit.getDataPlaces(cityModel.cId);
        cubit.getPopularPlace(cityModel.cId);
        cubit.getDataForCity(cityModel.cId);
        cubit.getAllBestPlan(cityModel.cId);

        // ✅ التنقل فورًا للشاشة التالية
        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(
            cityModel: cityModel,
            placeModel: placeModel,
            bestPLanModel: bestPLanModel,
          ),
        );

        // ✅ تحميل الطقس في الخلفية
        debugPrint('City ID = ${cityModel.cId}');
        final weather = await WeatherService().getWeather(
          cityName: cityModel.name,
        );

        if (!context.mounted) return;

        weatherProvider.cityName = cityModel.name;
        weatherProvider.weatherData = weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: ThemeApp.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).r,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)).r,
                child: CachedNetworkImage(
                  imageUrl: cityModel.image,
                  fit: BoxFit.fill,
                  height: 200.h,
                  width: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: AdaptiveIndicator(os: getOs())),
                  errorWidget: (context, url, error) =>
                      Icon(FontAwesomeIcons.info, size: 30.sp),
                ),
              ),
            ),
            LayerImage(width: 200.w, height: 210.h),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ThemeApp.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridFRItem extends StatelessWidget {
  const GridFRItem(
    this.placeModel,
    this.bestPLanModel, {
    super.key,
    required this.cityModel,
  });

  final CityModel cityModel;
  final PlaceModel placeModel;
  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        final cubit = TripsoCubit.get(context);
        final weatherProvider = Provider.of<WeatherProvider>(
          context,
          listen: false,
        );

        // ✅ تحميل البيانات المرتبطة بالمدينة
        cubit.getUserData();
        cubit.getDataPlaces(cityModel.cId);
        cubit.getPopularPlace(cityModel.cId);
        cubit.getDataForCity(cityModel.cId);
        cubit.getAllBestPlan(cityModel.cId);

        // ✅ التنقل فورًا للشاشة التالية
        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(
            cityModel: cityModel,
            placeModel: placeModel,
            bestPLanModel: bestPLanModel,
          ),
        );

        // ✅ تحميل الطقس في الخلفية
        debugPrint('City ID = ${cityModel.cId}');
        final weather = await WeatherService().getWeather(
          cityName: cityModel.name,
        );

        if (!context.mounted) return;

        weatherProvider.cityName = cityModel.name;
        weatherProvider.weatherData = weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: ThemeApp.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)).r,
                child: CachedNetworkImage(
                  imageUrl: cityModel.image,
                  fit: BoxFit.fill,
                  height: 200.h,
                  width: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: AdaptiveIndicator(os: getOs())),
                  errorWidget: (context, url, error) =>
                      Icon(FontAwesomeIcons.info, size: 30.sp),
                ),
              ),
            ),
            LayerImage(width: 200.w, height: 210.h),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ThemeApp.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GridPopularItem extends StatelessWidget {
  const GridPopularItem(
    this.placeModel,
    this.bestPLanModel, {
    super.key,
    required this.cityModel,
  });

  final CityModel cityModel;
  final PlaceModel placeModel;
  final BestPLanModel bestPLanModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () async {
        final cubit = TripsoCubit.get(context);
        final weatherProvider = Provider.of<WeatherProvider>(
          context,
          listen: false,
        );

        // ✅ تحميل البيانات المرتبطة بالمدينة
        cubit.getUserData();
        cubit.getDataPlaces(cityModel.cId);
        cubit.getPopularPlace(cityModel.cId);
        cubit.getDataForCity(cityModel.cId);
        cubit.getAllBestPlan(cityModel.cId);

        // ✅ التنقل فورًا للشاشة التالية
        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(
            cityModel: cityModel,
            placeModel: placeModel,
            bestPLanModel: bestPLanModel,
          ),
        );

        // ✅ تحميل الطقس في الخلفية
        debugPrint('City ID = ${cityModel.cId}');
        final weather = await WeatherService().getWeather(
          cityName: cityModel.name,
        );

        if (!context.mounted) return;

        weatherProvider.cityName = cityModel.name;
        weatherProvider.weatherData = weather;
      },
      child: Card(
        clipBehavior: Clip.none,
        elevation: 1,
        color: ThemeApp.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200.w,
              height: 210.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)).r,
                child: CachedNetworkImage(
                  imageUrl: cityModel.image,
                  fit: BoxFit.fill,
                  height: 200.h,
                  width: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(child: AdaptiveIndicator(os: getOs())),
                  errorWidget: (context, url, error) =>
                      Icon(FontAwesomeIcons.info, size: 30.sp),
                ),
              ),
            ),
            LayerImage(width: 200.w, height: 210.h),
            Text(
              cityModel.name,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: ThemeApp.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
