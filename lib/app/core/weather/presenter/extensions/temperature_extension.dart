extension TemperatureExtension on double {
  double convertToCelcius() => this - 273.15;
  String toLocateInCelcius() => '${convertToCelcius().toStringAsFixed(0)}°';
}
