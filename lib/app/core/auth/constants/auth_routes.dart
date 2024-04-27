import 'package:weather/app/commons/models/route_model.dart';

class AuthRoutes {
  static const prefix = '/auth';
  static RouteModel root = RouteModel(path: '/', prefix: prefix);
  static RouteModel register = RouteModel(path: '/register', prefix: prefix);
}
