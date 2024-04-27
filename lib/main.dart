import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app/app_module.dart';
import 'package:weather/app/app_widget.dart';
import 'package:weather/app/commons/services/firebase_messasing_service.dart';
import 'package:weather/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessasingService().initNotifications();

  runApp(ModularApp(
    module: AppModule(),
    child: const AppWidget(),
  ));
}
