import 'package:flutter/material.dart' show TextEditingController;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/app/commons/models/http_error_field_model.dart';
import 'package:weather/app/commons/services/user_service.dart';
import 'package:weather/app/core/auth/repositories/auth_repository.dart';
import 'package:weather/app/core/weather/constants/weather_routes.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store {
  final AuthRepository _repository;
  final UserService _userService;
  LoginViewModelBase(this._repository, this._userService);
  @observable
  bool isBusy = false;
  @observable
  List<HttpErrorFieldModel> errors = [];

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleClickRegister() {
    Modular.to.pushNamed('register');
  }

  @action
  Future<void> login() async {
    isBusy = true;
    var response = await _repository.login(
        email: emailController.text, password: passwordController.text);
    if (response.result != null) {
      await (await SharedPreferences.getInstance())
          .setString('token', response.result!);
      await _userService.isAuthenticated();
      Modular.to.pushNamedAndRemoveUntil(WeatherRoutes.prefix, (p0) => false);
    } else {
      errors = response.errors;
    }
    isBusy = false;
  }
}
