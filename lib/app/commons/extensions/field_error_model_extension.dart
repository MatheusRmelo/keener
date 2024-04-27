import 'package:weather/app/commons/models/http_error_field_model.dart';

extension FieldErrorModelExtension on List<HttpErrorFieldModel> {
  String? getErrorWithCode(String key) {
    int index = indexWhere((element) => element.key == key);
    if (index == -1) return null;
    return this[index].errors.isEmpty ? "" : this[index].errors.first;
  }
}
