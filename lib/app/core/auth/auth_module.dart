import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app/app_module.dart';
import 'package:weather/app/core/auth/constants/auth_routes.dart';
import 'package:weather/app/core/auth/presenter/view_models/login_view_model.dart';
import 'package:weather/app/core/auth/presenter/view_models/register_view_model.dart';
import 'package:weather/app/core/auth/presenter/views/login_view.dart';
import 'package:weather/app/core/auth/presenter/views/register_view.dart';

class AuthModule extends Module {
  @override
  List<Module> get imports => [
        AppModule(),
      ];

  @override
  void binds(i) {
    //ViewModels
    i.addLazySingleton<LoginViewModel>(LoginViewModel.new);
    i.addLazySingleton<RegisterViewModel>(RegisterViewModel.new);
  }

  @override
  void routes(r) {
    r.child(
      AuthRoutes.root.path,
      child: (context) => const LoginView(),
    );
    r.child(
      AuthRoutes.register.path,
      child: (context) => const RegisterView(),
    );
  }
}
