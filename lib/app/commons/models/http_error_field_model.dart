class HttpErrorFieldModel {
  String key;
  List<String> errors;

  HttpErrorFieldModel({required this.key, required this.errors});

  HttpErrorFieldModel.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        errors = (json['errors'] as List).map((e) => e.toString()).toList();
}
