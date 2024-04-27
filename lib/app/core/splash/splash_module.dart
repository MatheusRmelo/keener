import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app/app_module.dart';
import 'package:weather/app/core/splash/constants/splash_routes.dart';
import 'package:weather/app/core/splash/presenter/views/splash_view.dart';
import 'package:weather/app/core/splash/presenter/view_models/splash_view_model.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {
    //ViewModels
    i.addLazySingleton<SplashViewModel>(SplashViewModel.new);
  }

  @override
  void routes(r) {
    r.child(
      SplashRoutes.root.path,
      child: (context) => const SplashView(),
    );
  }
}
