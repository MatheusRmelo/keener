import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/app/commons/models/http_error_field_model.dart';
import 'package:weather/app/commons/models/response/response_model.dart';

mixin ApiHttpClient {
  final String _baseUrl = "http://192.168.0.5:8000/api";

  Future<ResponseModel<T>> get<T>(String path,
      {T Function(Map<String, dynamic> json)? parser,
      Map<String, String>? header}) async {
    Uri url = Uri.parse('$_baseUrl/$path');
    header = header ?? {};
    String? token = (await SharedPreferences.getInstance()).getString('token');
    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }
    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/json';
    http.Response result = await http.get(url, headers: header);
    Map<String, dynamic> json = jsonDecode(result.body);
    if (result.statusCode >= 200 && result.statusCode <= 299) {
      return ResponseModel<T>(
          statusCode: result.statusCode,
          description: json['description'] ?? "Sucesso",
          ok: true,
          result: parser == null ? json['result'] : parser(json['result']));
    }
    if (result.statusCode == 401) {
      return ResponseModel<T>(
          statusCode: result.statusCode,
          technicalDescription: json['technicalDescription'],
          description: 'Não autorizado',
          ok: false,
          errors: null,
          result: json['result']);
    }

    return ResponseModel<T>(
        statusCode: result.statusCode,
        technicalDescription:
            json['technicalDescription'] ?? "Falha no serviço",
        description: json['description'] ?? "Falha no serviço",
        ok: false,
        result: json['result']);
  }

  Future<ResponseModel<T>> getList<T>(String path,
      {T Function(List json)? parser, Map<String, String>? header}) async {
    Uri url = Uri.parse('$_baseUrl/$path');
    header = header ?? {};
    String? token = (await SharedPreferences.getInstance()).getString('token');
    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }
    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/json';
    http.Response result = await http.get(url, headers: header);
    Map<String, dynamic> json = jsonDecode(result.body);
    if (result.statusCode >= 200 && result.statusCode <= 299) {
      return ResponseModel<T>(
          statusCode: result.statusCode,
          description: json['description'] ?? "Sucesso",
          ok: true,
          result: parser == null ? json['result'] : parser(json['result']));
    }
    if (result.statusCode == 401) {
      return ResponseModel<T>(
          statusCode: result.statusCode,
          technicalDescription: json['technicalDescription'],
          description: 'Não autorizado',
          ok: false,
          errors: null,
          result: json['result']);
    }

    return ResponseModel<T>(
        statusCode: result.statusCode,
        technicalDescription:
            json['technicalDescription'] ?? "Falha no serviço",
        description: json['description'] ?? "Falha no serviço",
        ok: false,
        result: json['result']);
  }

  Future<ResponseModel> getCustom(String path,
      {Map<String, String>? header}) async {
    Uri url = Uri.parse('$_baseUrl/$path');
    header = header ?? {};
    String? token = (await SharedPreferences.getInstance()).getString('token');
    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }
    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/json';
    http.Response result = await http.get(url, headers: header);
    Map<String, dynamic> json = jsonDecode(result.body);
    if (result.statusCode >= 200 && result.statusCode <= 299) {
      return ResponseModel(
          statusCode: result.statusCode,
          description: json['description'],
          ok: true,
          result: json['result']);
    }
    if (result.statusCode == 401) {
      return ResponseModel(
          statusCode: result.statusCode,
          technicalDescription: json['technicalDescription'],
          description: json['description'],
          ok: false,
          errors: null,
          result: json['result']);
    }

    return ResponseModel(
        statusCode: result.statusCode,
        technicalDescription:
            json['technicalDescription'] ?? "Falha no serviço",
        description: json['description'] ?? "Falha no serviço",
        ok: false,
        result: json['result']);
  }

  Future<ResponseModel<T>> post<T>(String path, Map<String, dynamic> body,
      {T Function(Map<String, dynamic> json)? parser,
      Map<String, String>? header}) async {
    Uri url = Uri.parse('$_baseUrl/$path');

    header = header ?? {};
    String? token = (await SharedPreferences.getInstance()).getString('token');
    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }
    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/json';
    http.Response result =
        await http.post(url, body: jsonEncode(body), headers: header);
    Map<String, dynamic> json = jsonDecode(result.body);
    try {
      if (result.statusCode >= 200 && result.statusCode <= 299) {
        return ResponseModel<T>(
            statusCode: result.statusCode,
            description: json['description'],
            ok: true,
            code: json['code'],
            result: parser == null ? json['result'] : parser(json['result']));
      }
      if (result.statusCode == 401) {
        return ResponseModel<T>(
            statusCode: result.statusCode,
            technicalDescription: json['technicalDescription'],
            description: json['message'] ?? json['description'],
            ok: false,
            code: json['code'],
            errors: json['errors'] == null
                ? null
                : (json['errors'] as Map<String, dynamic>)
                    .entries
                    .map((e) => HttpErrorFieldModel.fromJson(
                        {'key': e.key, 'errors': e.value}))
                    .toList(),
            result: json['result']);
      }

      return ResponseModel<T>(
          statusCode: result.statusCode,
          technicalDescription: json['technicalDescription'],
          description: json['message'],
          ok: false,
          code: json['code'],
          errors: json['errors'] == null
              ? null
              : (json['errors'] as Map<String, dynamic>)
                  .entries
                  .map((e) => HttpErrorFieldModel.fromJson(
                      {'key': e.key, 'errors': e.value}))
                  .toList(),
          result: json['result']);
    } catch (e) {
      return ResponseModel<T>(
          statusCode: 503,
          technicalDescription: e.toString(),
          description: 'Ocorreu um erro interno na aplicação',
          ok: false,
          errors: [],
          result: null);
    }
  }

  Future<ResponseModel<T>> put<T>(String path, Map<String, dynamic> body,
      {T Function(Map<String, dynamic> json)? parser,
      Map<String, String>? header}) async {
    Uri url = Uri.parse('$_baseUrl/$path');

    header = header ?? {};
    String? token = (await SharedPreferences.getInstance()).getString('token');

    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }
    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/json';
    http.Response result =
        await http.put(url, body: jsonEncode(body), headers: header);
    Map<String, dynamic> json = jsonDecode(result.body);
    if (result.statusCode >= 200 && result.statusCode <= 299) {
      return ResponseModel<T>(
          statusCode: result.statusCode,
          description: json['message'] ?? "Sucesso",
          ok: true,
          code: json['code'],
          result: parser == null ? json['result'] : parser(json['result']));
    }
    if (result.statusCode == 401) {
      return ResponseModel<T>(
          statusCode: result.statusCode,
          technicalDescription: json['technicalDescription'],
          description: json['message'] ?? "Unauthorized",
          ok: false,
          code: json['code'],
          errors: json['errors'] == null
              ? null
              : (json['errors'] as Map<String, dynamic>)
                  .entries
                  .map((e) => HttpErrorFieldModel.fromJson(
                      {'key': e.key, 'errors': e.value}))
                  .toList(),
          result: json['result']);
    }
    if (result.statusCode == 400) {
      return ResponseModel<T>(
          statusCode: result.statusCode,
          technicalDescription: json['technicalDescription'],
          description: json['message'] ?? "Bad Request",
          ok: false,
          code: json['code'],
          errors: json['errors'] == null
              ? null
              : (json['errors'] as Map<String, dynamic>)
                  .entries
                  .map((e) => HttpErrorFieldModel.fromJson(
                      {'key': e.key, 'errors': e.value}))
                  .toList(),
          result: null);
    }

    return ResponseModel<T>(
        statusCode: result.statusCode,
        technicalDescription: json['technicalDescription'],
        description: json['message'] ?? "Failed",
        ok: false,
        code: json['code'],
        errors: json['errors'] == null
            ? null
            : (json['errors'] as Map<String, dynamic>)
                .entries
                .map((e) => HttpErrorFieldModel.fromJson(
                    {'key': e.key, 'errors': e.value}))
                .toList(),
        result: json['result']);
  }

  Future<ResponseModel<T>> delete<T>(String path,
      {T Function(Map<String, dynamic> json)? parser,
      Map<String, String>? header}) async {
    Uri url = Uri.parse('$_baseUrl/$path');
    header = header ?? {};
    String? token = (await SharedPreferences.getInstance()).getString('token');
    if (token != null) {
      header['Authorization'] = 'Bearer $token';
    }
    header['Content-Type'] = 'application/json';
    header['Accept'] = 'application/json';
    http.Response result = await http.delete(url, headers: header);
    Map<String, dynamic> json = jsonDecode(result.body);
    if (result.statusCode >= 200 && result.statusCode <= 299) {
      return ResponseModel<T>(
          statusCode: result.statusCode,
          description: json['description'],
          ok: true,
          result: parser == null ? json['result'] : parser(json['result']));
    }
    if (result.statusCode == 401) {
      return ResponseModel<T>(
          statusCode: result.statusCode,
          technicalDescription: json['technicalDescription'],
          description: json['description'],
          ok: false,
          errors: null,
          result: json['result']);
    }

    return ResponseModel<T>(
        statusCode: result.statusCode,
        technicalDescription:
            json['technicalDescription'] ?? "Falha no serviço",
        description: json['description'] ?? "Falha no serviço",
        ok: false,
        result: json['result']);
  }
}
