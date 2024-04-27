import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app/commons/services/firebase_messasing_service.dart';
import 'package:weather/app/commons/services/user_service.dart';
import 'package:weather/app/core/auth/auth_module.dart';
import 'package:weather/app/core/auth/constants/auth_routes.dart';
import 'package:weather/app/core/auth/repositories/auth_repository.dart';
import 'package:weather/app/core/splash/constants/splash_routes.dart';
import 'package:weather/app/core/splash/splash_module.dart';
import 'package:weather/app/core/weather/constants/weather_routes.dart';
import 'package:weather/app/core/weather/weather_module.dart';

class AppModule extends Module {
  @override
  void exportedBinds(i) {
    //Repositories
    i.addSingleton<AuthRepository>(AuthRepositoryImplementation.new);
    //Services
    i.addSingleton<UserService>(UserService.new);
    i.addSingleton<FirebaseMessasingService>(FirebaseMessasingService.new);
  }

  @override
  void routes(r) {
    r.module(SplashRoutes.prefix, module: SplashModule());
    r.module(AuthRoutes.prefix, module: AuthModule());
    r.module(WeatherRoutes.prefix, module: WeatherModule());
  }
}
