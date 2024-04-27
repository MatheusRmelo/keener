import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app/app_module.dart';
import 'package:weather/app/core/weather/constants/weather_routes.dart';
import 'package:weather/app/core/weather/presenter/view_models/weather_view_model.dart';
import 'package:weather/app/core/weather/presenter/views/weather_view.dart';
import 'package:weather/app/core/weather/repositories/location_repository.dart';

class WeatherModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {
    //Repositories
    i.add<LocationRepository>(LocationRepositoryImplementation.new);
    //ViewModels
    i.addLazySingleton<WeatherViewModel>(WeatherViewModel.new);
  }

  @override
  void routes(r) {
    r.child(
      WeatherRoutes.root.path,
      child: (context) => const WeatherView(),
    );
  }
}
