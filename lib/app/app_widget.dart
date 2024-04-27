import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app/commons/globals/globals.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: snackbarKey,
      routerConfig: Modular.routerConfig,
      title: 'Weather',
      debugShowCheckedModeBanner: false,
    );
  }
}
