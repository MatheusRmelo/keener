// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on LoginViewModelBase, Store {
  late final _$isBusyAtom =
      Atom(name: 'LoginViewModelBase.isBusy', context: context);

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

  late final _$errorsAtom =
      Atom(name: 'LoginViewModelBase.errors', context: context);

  @override
  List<HttpErrorFieldModel> get errors {
    _$errorsAtom.reportRead();
    return super.errors;
  }

  @override
  set errors(List<HttpErrorFieldModel> value) {
    _$errorsAtom.reportWrite(value, super.errors, () {
      super.errors = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('LoginViewModelBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  @override
  String toString() {
    return '''
isBusy: ${isBusy},
errors: ${errors}
    ''';
  }
}
