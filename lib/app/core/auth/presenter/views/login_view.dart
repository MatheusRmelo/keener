import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:weather/app/commons/extensions/field_error_model_extension.dart';
import 'package:weather/app/commons/widgets/button_widget.dart';
import 'package:weather/app/commons/widgets/form/form_field_widget.dart';
import 'package:weather/app/commons/widgets/form/text_field_widget.dart';
import 'package:weather/app/core/auth/presenter/view_models/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _viewModel = Modular.get<LoginViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: null, elevation: 0, backgroundColor: Colors.transparent),
        body: Observer(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(32),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Bem vindo ao Weather APP",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Entre agora e visualize o clima",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    FormFieldWidget(
                        label: 'E-mail',
                        child: TextFieldWidget(
                          controller: _viewModel.emailController,
                          placeholder: 'Digite o seu e-mail',
                          prefixIcon: const Icon(Icons.email_rounded),
                          error: _viewModel.errors.getErrorWithCode('email'),
                          keyboardType: TextInputType.emailAddress,
                        )),
                    FormFieldWidget(
                        label: 'Senha',
                        child: TextFieldWidget(
                          isPassword: true,
                          controller: _viewModel.passwordController,
                          placeholder: 'Digite a sua senha',
                          error: _viewModel.errors.getErrorWithCode('password'),
                          prefixIcon: const Icon(Icons.security_rounded),
                        )),
                    ButtonWidget(
                        title: 'Entrar',
                        margin: const EdgeInsets.only(top: 16),
                        isLoading: _viewModel.isBusy,
                        onPressed: _viewModel.login),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          onPressed: _viewModel.handleClickRegister,
                          child: const Text(
                            "Não tem conta ainda? Crie uma agora!",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    )
                  ]),
            ),
          );
        }));
  }
}
