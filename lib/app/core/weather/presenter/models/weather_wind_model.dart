class WeatherWindModel {
  double speed;
  double deg;

  WeatherWindModel({required this.speed, required this.deg});

  factory WeatherWindModel.fromJson(Map<String, dynamic> json) =>
      WeatherWindModel(
          speed:
              json['speed'] is int ? json['speed'].toDouble() : json['speed'],
          deg: json['deg'] is int ? json['deg'].toDouble() : json['deg']);
}
