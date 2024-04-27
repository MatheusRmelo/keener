class WeatherCloudsModel {
  double all;

  WeatherCloudsModel({required this.all});

  factory WeatherCloudsModel.fromJson(Map<String, dynamic> json) =>
      WeatherCloudsModel(
          all: json['all'] is int ? json['all'].toDouble() : json['all']);
}
