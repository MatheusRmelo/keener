import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app/commons/widgets/button_widget.dart';
import 'package:weather/app/core/weather/presenter/extensions/temperature_extension.dart';
import 'package:weather/app/core/weather/presenter/view_models/weather_view_model.dart';
import 'package:weather/app/core/weather/presenter/views/widgets/detail_item_widget.dart';

class WeatherView extends StatefulWidget {
  const WeatherView({super.key});

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  final _viewModel = Modular.get<WeatherViewModel>();

  @override
  void initState() {
    super.initState();
    _viewModel.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
              'Clima ${_viewModel.local == null ? '' : 'de ${_viewModel.local!.name}'}'),
          centerTitle: true,
        ),
        body: Builder(
          builder: (context) {
            if (_viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (_viewModel.location == null) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    const Text(
                      'Permita a localização para ter acesso a um clima',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    ButtonWidget(
                        margin: const EdgeInsets.only(top: 8),
                        title: 'Permitir',
                        onPressed: _viewModel.getCurrentPosition)
                  ],
                ),
              );
            }
            if (_viewModel.local == null) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 120,
                    ),
                    const Text(
                      'Falha ao encontrar o seu local',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    ButtonWidget(
                        margin: const EdgeInsets.only(top: 8),
                        title: 'Tentar novamente',
                        onPressed: _viewModel.geocode)
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _viewModel.local!.name,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  '${_viewModel.local!.weather.main.temp.convertToCelcius().toStringAsFixed(0)}°',
                                  style: const TextStyle(
                                      fontSize: 32, color: Colors.white),
                                ),
                              ],
                            )),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                DetailItemWidget(
                                    label: 'Temp. Min',
                                    value: _viewModel
                                        .local!.weather.main.tempMin
                                        .toLocateInCelcius()),
                                DetailItemWidget(
                                    label: 'Temp. Max',
                                    value: _viewModel
                                        .local!.weather.main.tempMax
                                        .toLocateInCelcius()),
                                DetailItemWidget(
                                    label: 'Sensação térmica',
                                    value: _viewModel
                                        .local!.weather.main.feelsLike
                                        .toLocateInCelcius()),
                                DetailItemWidget(
                                    label: 'Preesão',
                                    value: _viewModel
                                        .local!.weather.main.pressure
                                        .toLocateInCelcius()),
                                DetailItemWidget(
                                    label: 'Humidade',
                                    value: _viewModel
                                        .local!.weather.main.humidity
                                        .toLocateInCelcius()),
                                DetailItemWidget(
                                    label: 'Velocidade do vento',
                                    value: _viewModel.local!.weather.wind.speed
                                        .toString())
                              ],
                            ))
                      ],
                    ),
                  ),
                  const Spacer(),
                  ButtonWidget(
                    title: 'Sair',
                    onPressed: _viewModel.logout,
                    isLoading: _viewModel.isBusy,
                  ),
                  const SizedBox(
                    height: 48,
                  )
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
