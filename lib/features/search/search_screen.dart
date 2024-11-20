import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tripso/layout/layout.dart';
import 'package:tripso/model/arg_model.dart';
import 'package:tripso/model/best_plan_model.dart';
import 'package:tripso/model/city_model.dart';
import 'package:tripso/model/place_model.dart';
import 'package:tripso/model/weather_model.dart';
import 'package:tripso/shared/adaptive/indicator.dart';
import 'package:tripso/shared/components/my_divider.dart';
import 'package:tripso/shared/components/navigator.dart';
import 'package:tripso/shared/components/sized_box.dart';
import 'package:tripso/shared/constants/constants.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_cubit.dart';
import 'package:tripso/shared/cubit/tripsoCubit/tripso_state.dart';
import 'package:tripso/shared/provider/weather_provider.dart';
import 'package:tripso/shared/service/weather_service.dart';
import 'package:tripso/shared/styles/asset_path.dart';
import 'package:tripso/shared/styles/theme.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // This list holds the data for the list view
  List<CityModel> foundCity = [];

  @override
  initState() {
    // at the beginning, all users are shown
    foundCity = [];
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List<CityModel> results = [];
    if (enteredKeyword.trim().isEmpty) {
      results = TripsoCubit.get(context).city;
    } else {
      results = TripsoCubit.get(context)
          .city
          .where(
            (city) => city.name.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
    }
    setState(() {
      foundCity = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TripsoCubit, TripsoStates>(
        builder: (context, state) {
          var cubit = TripsoCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: ThemeApp.secondaryColor,
              centerTitle: false,
              elevation: 2,
              leading: IconButton(
                icon: const ImageIcon(
                  color: Colors.black,
                  AssetImage(
                    AssetPath.searchImage,
                  ),
                ),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 25.sp,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
              title: TextFormField(
                maxLines: 1,
                autofocus: true,
                keyboardType: TextInputType.text,
                enableInteractiveSelection: true,
                style: GoogleFonts.libreBaskerville(),
                enableSuggestions: true,
                scrollPhysics: const BouncingScrollPhysics(),
                decoration: InputDecoration(
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: 'Search',
                  hintStyle: GoogleFonts.roboto(
                    fontSize: 20.sp,
                  ),
                ),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'The search can\'t be empty';
                  }
                  return null;
                },
                onFieldSubmitted: (value) {},
                onChanged: (value) {
                  runFilter(value.trim());
                },
              ),
            ),
            body: foundCity.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.search,
                        color: ThemeApp.primaryColor,
                        size: 120.sp,
                      ),
                      Text(
                        "Not found !".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          fontSize: 25.sp,
                        ),
                      ),
                    ],
                  )
                : ListView.separated(
                    itemBuilder: (context, index) => singleUserBuilder(
                        foundCity[index],
                        context,
                        cubit.placeModel!,
                        cubit.bestPLanModel!),
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0).r,
                      child: MyDivider(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    itemCount: foundCity.length,
                  ),
          );
        },
        listener: (context, state) {});
  }

  Widget singleUserBuilder(CityModel city, BuildContext context,
      PlaceModel placeModel, BestPLanModel bestPLanModel) {
    return InkWell(
      onTap: () async {
        TripsoCubit.get(context).getUserData();
        TripsoCubit.get(context).getDataPlaces(city.cId);
        TripsoCubit.get(context).getPopularPlace(city.cId);
        TripsoCubit.get(context).getDataForCity(city.cId);
        TripsoCubit.get(context).getAllBestPlan(city.cId);
        navigateTo(
          context,
          routeName: HomeLayout.routeName,
          arguments: ScreenArgs(
              cityModel: city,
              placeModel: placeModel,
              bestPLanModel: bestPLanModel),
        );

        debugPrint('City ID = ${city.cId}');
        WeatherService service = WeatherService();
        WeatherModel? weather = await service.getWeather(cityName: city.name);
        Provider.of<WeatherProvider>(context, listen: false).cityName =
            city.name;
        Provider.of<WeatherProvider>(context, listen: false).weatherData =
            weather;
      },
      child: Container(
        height: 140.h,
        margin: const EdgeInsets.all(8).r,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(20).r,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0).r,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      city.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Space(height: 10.h, width: 0.w),
                    Expanded(
                      child: Text(
                        city.history,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.black54,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              width: 170.w,
              height: 170.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: const Radius.circular(20).r,
                  topRight: const Radius.circular(20).r,
                ),
              ),
              child: CachedNetworkImage(
                imageUrl: city.image,
                fit: BoxFit.fill,
                height: 225.h,
                width: double.infinity,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: AdaptiveIndicator(
                    os: getOs(),
                  ),
                ),
                errorWidget: (context, url, error) => Center(
                  child: AdaptiveIndicator(
                    os: getOs(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
