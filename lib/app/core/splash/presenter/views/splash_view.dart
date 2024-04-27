import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app/core/splash/presenter/view_models/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final _viewModel = Modular.get<SplashViewModel>();
  @override
  void initState() {
    super.initState();
    _viewModel.isAuthenticated();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(body: Observer(builder: (context) {
      return Center(
          child: SizedBox(
              width: size.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Weather APP',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  if (_viewModel.isLoading)
                    Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: const CircularProgressIndicator()),
                ],
              )));
    }));
  }
}
