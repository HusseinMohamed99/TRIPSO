import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripso/model/weather_model.dart';
import 'package:tripso/shared/cubit/weatherCubit/weather_state.dart';
import 'package:tripso/shared/service/weather_service.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherData;
  String? cityName;

  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherData;
}

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;

  WeatherCubit(this.weatherService) : super(WeatherInitial());

  Future<void> fetchWeather(String cityName) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherService.getWeather(cityName: cityName);
      emit(WeatherLoaded(weather));
    } catch (error) {
      emit(WeatherError(error.toString()));
    }
  }
}
