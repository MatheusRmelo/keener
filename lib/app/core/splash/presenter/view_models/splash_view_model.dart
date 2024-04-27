import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/app/commons/services/user_service.dart';
import 'package:weather/app/core/auth/constants/auth_routes.dart';
import 'package:weather/app/core/weather/constants/weather_routes.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = SplashViewModelBase with _$SplashViewModel;

abstract class SplashViewModelBase with Store {
  final UserService _userService;
  SplashViewModelBase(this._userService);

  @observable
  bool isLoading = false;

  @action
  Future<void> isAuthenticated() async {
    isLoading = true;
    var response = await _userService.isAuthenticated();
    isLoading = false;
    if (response) {
      Modular.to.pushNamedAndRemoveUntil(WeatherRoutes.prefix, (p0) => false);
    } else {
      Modular.to.pushNamedAndRemoveUntil(AuthRoutes.prefix, (p0) => false);
    }
  }
}
