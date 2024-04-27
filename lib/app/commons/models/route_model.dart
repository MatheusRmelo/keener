class RouteModel {
  String path;
  String prefix;

  RouteModel({required this.path, required this.prefix});

  String get complete => "$prefix$path";

  String getPathUsingParams(Map<String, String> params,
      {bool complete = false}) {
    String newPath = path;
    params.forEach((key, value) {
      newPath = newPath.replaceAll(':$key', value);
    });
    if (complete) {
      return "$prefix$newPath";
    }

    return newPath;
  }
}
