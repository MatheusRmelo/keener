import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mobx/mobx.dart';
import 'package:weather/app/commons/globals/globals.dart';
import 'package:weather/app/commons/services/user_service.dart';
import 'package:weather/app/core/auth/constants/auth_routes.dart';
import 'package:weather/app/core/weather/presenter/models/location_model.dart';
import 'package:weather/app/core/weather/repositories/location_repository.dart';

part 'weather_view_model.g.dart';

class WeatherViewModel = WeatherViewModelBase with _$WeatherViewModel;

abstract class WeatherViewModelBase with Store {
  final LocationRepository _repository;
  final UserService _userService;
  WeatherViewModelBase(this._repository, this._userService);
  @observable
  bool isLoading = false;
  @observable
  String? error;
  @observable
  Position? location;
  @observable
  LocationModel? local;
  @observable
  bool isBusy = false;
  @observable
  RemoteMessage? message;

  @action
  Future<void> setMessage(RemoteMessage? message) async {
    this.message = message;
    if (message != null) {
      await geocode();
      snackbarKey.currentState?.showSnackBar(SnackBar(
        content: Text(
          'O clima em ${local?.name ?? 'Desconhecido'} teve alterações e acabou de ser atualizado!',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ));
    }
  }

  @action
  Future<void> getCurrentPosition() async {
    isLoading = true;
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    location = await Geolocator.getCurrentPosition();
    geocode();
    isLoading = false;
  }

  @action
  Future<void> geocode() async {
    if (location == null) return;
    isLoading = true;
    var response = await _repository.geocode(
        latitude: location!.latitude, longitude: location!.longitude);
    if (response.result != null) {
      local = response.result;
    }
    isLoading = false;
  }

  @action
  Future<void> logout() async {
    isBusy = true;
    var response = await _userService.logout();
    if (response) {
      Modular.to.pushNamedAndRemoveUntil(AuthRoutes.prefix, (p0) => false);
    }
    isBusy = false;
  }
}
