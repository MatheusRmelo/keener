import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/app/commons/services/firebase_messasing_service.dart';
import 'package:weather/app/core/auth/presenter/models/user_model.dart';
import 'package:weather/app/core/auth/repositories/auth_repository.dart';

class UserService {
  final AuthRepository _repository;
  final FirebaseMessasingService _firebaseMessasingService;
  UserService(this._repository, this._firebaseMessasingService);
  UserModel? user;
  Future<bool> isAuthenticated() async {
    final fcmToken = await _firebaseMessasingService.getFcmToken();
    var result = await _repository.verifyToken(fcmToken: fcmToken);
    user = result.result;
    return result.ok;
  }

  Future<bool> logout() async {
    var result = await _repository.logout();
    if (result.ok) {
      user = null;
      (await SharedPreferences.getInstance()).clear();
    }

    return result.ok;
  }
}
