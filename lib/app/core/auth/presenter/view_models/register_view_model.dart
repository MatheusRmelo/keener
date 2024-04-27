import 'package:flutter/material.dart' show TextEditingController;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/app/commons/models/http_error_field_model.dart';
import 'package:weather/app/commons/services/user_service.dart';
import 'package:weather/app/core/auth/repositories/auth_repository.dart';
import 'package:weather/app/core/weather/constants/weather_routes.dart';

part 'register_view_model.g.dart';

class RegisterViewModel = RegisterViewModelBase with _$RegisterViewModel;

abstract class RegisterViewModelBase with Store {
  final AuthRepository _repository;
  final UserService _userService;

  RegisterViewModelBase(this._repository, this._userService);

  @observable
  bool isBusy = false;
  @observable
  List<HttpErrorFieldModel> errors = [];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleClickLogin() {
    if (Modular.to.canPop()) {
      Modular.to.pop();
    } else {
      Modular.to.pushReplacementNamed('login');
    }
  }

  @action
  Future<void> register() async {
    isBusy = true;
    var response = await _repository.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text);
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
