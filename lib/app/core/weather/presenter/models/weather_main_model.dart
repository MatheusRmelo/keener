class WeatherMainModel {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  double pressure;
  double humidity;

  WeatherMainModel(
      {required this.temp,
      required this.feelsLike,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity});

  factory WeatherMainModel.fromJson(Map<String, dynamic> json) =>
      WeatherMainModel(
          temp: json['temp'] is int ? json['temp'].toDouble() : json['temp'],
          feelsLike: json['feels_like'] is int
              ? json['feels_like'].toDouble()
              : json['feels_like'],
          tempMin: json['temp_min'] is int
              ? json['temp_min'].toDouble()
              : json['temp_min'],
          tempMax: json['temp_max'] is int
              ? json['temp_max'].toDouble()
              : json['temp_max'],
          humidity: json['humidity'] is int
              ? json['humidity'].toDouble()
              : json['humidity'],
          pressure: json['pressure'] is int
              ? json['pressure'].toDouble()
              : json['pressure']);
}
