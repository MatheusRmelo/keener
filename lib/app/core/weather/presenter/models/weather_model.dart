import 'package:weather/app/core/weather/presenter/models/weather_clouds_model.dart';
import 'package:weather/app/core/weather/presenter/models/weather_main_model.dart';
import 'package:weather/app/core/weather/presenter/models/weather_wind_model.dart';

class WeatherModel {
  WeatherMainModel main;
  WeatherWindModel wind;
  WeatherCloudsModel clouds;

  WeatherModel({required this.main, required this.wind, required this.clouds});

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
      main: WeatherMainModel.fromJson(json['main']),
      wind: WeatherWindModel.fromJson(json['wind']),
      clouds: WeatherCloudsModel.fromJson(json['clouds']));
}
