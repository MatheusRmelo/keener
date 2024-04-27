import 'package:weather/app/commons/mixins/api_http_client.dart';
import 'package:weather/app/commons/models/response/response_model.dart';
import 'package:weather/app/core/weather/presenter/models/location_model.dart';

abstract class LocationRepository {
  Future<ResponseModel<LocationModel>> geocode(
      {required double latitude, required double longitude});
}

class LocationRepositoryImplementation extends LocationRepository
    with ApiHttpClient {
  LocationRepositoryImplementation();
  final String _path = 'locations';

  @override
  Future<ResponseModel<LocationModel>> geocode(
      {required double latitude, required double longitude}) async {
    final result = await post<LocationModel>(
        '$_path/geocode', {'latitude': latitude, 'longitude': longitude},
        parser: LocationModel.fromJson);
    return result;
  }
}
