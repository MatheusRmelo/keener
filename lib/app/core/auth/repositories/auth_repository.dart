import 'package:weather/app/commons/mixins/api_http_client.dart';
import 'package:weather/app/commons/models/response/response_model.dart';
import 'package:weather/app/core/auth/presenter/models/user_model.dart';

abstract class AuthRepository {
  Future<ResponseModel<String>> login(
      {required String email, required String password});
  Future<ResponseModel<String>> register(
      {required String name, required String email, required String password});
  Future<ResponseModel<dynamic>> logout();
  Future<ResponseModel<UserModel>> verifyToken({String? fcmToken});
}

class AuthRepositoryImplementation extends AuthRepository with ApiHttpClient {
  AuthRepositoryImplementation();
  final String _path = 'auth';

  @override
  Future<ResponseModel<String>> login(
      {required String email, required String password}) async {
    final result = await post<String>(
      '$_path/login',
      {'email': email, 'password': password},
    );
    return result;
  }

  @override
  Future<ResponseModel<UserModel>> verifyToken({String? fcmToken}) async {
    final result = await get(
        '$_path/verify-token?${fcmToken != null ? 'fcmToken=$fcmToken' : ''}',
        parser: UserModel.fromJson);
    return result;
  }

  @override
  Future<ResponseModel> logout() async {
    final result = await post('$_path/logout', {});
    return result;
  }

  @override
  Future<ResponseModel<String>> register(
      {required String name,
      required String email,
      required String password}) async {
    final result = await post<String>(
      '$_path/register',
      {'name': name, 'email': email, 'password': password},
    );
    return result;
  }
}
