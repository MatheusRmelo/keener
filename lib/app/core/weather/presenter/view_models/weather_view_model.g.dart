// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WeatherViewModel on WeatherViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'WeatherViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorAtom =
      Atom(name: 'WeatherViewModelBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$locationAtom =
      Atom(name: 'WeatherViewModelBase.location', context: context);

  @override
  Position? get location {
    _$locationAtom.reportRead();
    return super.location;
  }

  @override
  set location(Position? value) {
    _$locationAtom.reportWrite(value, super.location, () {
      super.location = value;
    });
  }

  late final _$localAtom =
      Atom(name: 'WeatherViewModelBase.local', context: context);

  @override
  LocationModel? get local {
    _$localAtom.reportRead();
    return super.local;
  }

  @override
  set local(LocationModel? value) {
    _$localAtom.reportWrite(value, super.local, () {
      super.local = value;
    });
  }

  late final _$isBusyAtom =
      Atom(name: 'WeatherViewModelBase.isBusy', context: context);

  @override
  bool get isBusy {
    _$isBusyAtom.reportRead();
    return super.isBusy;
  }

  @override
  set isBusy(bool value) {
    _$isBusyAtom.reportWrite(value, super.isBusy, () {
      super.isBusy = value;
    });
  }

  late final _$messageAtom =
      Atom(name: 'WeatherViewModelBase.message', context: context);

  @override
  RemoteMessage? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(RemoteMessage? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  late final _$setMessageAsyncAction =
      AsyncAction('WeatherViewModelBase.setMessage', context: context);

  @override
  Future<void> setMessage(RemoteMessage? message) {
    return _$setMessageAsyncAction.run(() => super.setMessage(message));
  }

  late final _$getCurrentPositionAsyncAction =
      AsyncAction('WeatherViewModelBase.getCurrentPosition', context: context);

  @override
  Future<void> getCurrentPosition() {
    return _$getCurrentPositionAsyncAction
        .run(() => super.getCurrentPosition());
  }

  late final _$geocodeAsyncAction =
      AsyncAction('WeatherViewModelBase.geocode', context: context);

  @override
  Future<void> geocode() {
    return _$geocodeAsyncAction.run(() => super.geocode());
  }

  late final _$logoutAsyncAction =
      AsyncAction('WeatherViewModelBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
error: ${error},
location: ${location},
local: ${local},
isBusy: ${isBusy},
message: ${message}
    ''';
  }
}
