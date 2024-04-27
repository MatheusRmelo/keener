import 'package:weather/app/commons/models/http_error_field_model.dart';

class ResponseModel<T> {
  final bool ok;
  final T? result;
  final String description;
  final String? technicalDescription;
  final String? code;
  final int? statusCode;
  final List<HttpErrorFieldModel> errors;

  ResponseModel({
    required this.ok,
    this.result,
    this.description = '',
    this.technicalDescription,
    this.code = "",
    this.statusCode,
    List<HttpErrorFieldModel>? errors,
  }) : errors = errors ?? [];
}
