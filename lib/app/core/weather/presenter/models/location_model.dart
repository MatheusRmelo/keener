import 'package:weather/app/core/weather/presenter/models/weather_model.dart';

class LocationModel {
  int id;
  String latitude;
  String longitude;
  String name;
  WeatherModel weather;
  LocationModel(
      {required this.id,
      required this.latitude,
      required this.longitude,
      required this.name,
      required this.weather});

  factory LocationModel.fromJson(Map<String, dynamic> json) => LocationModel(
      id: json['id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      name: json['name'],
      weather: WeatherModel.fromJson(json['weather']));
}
