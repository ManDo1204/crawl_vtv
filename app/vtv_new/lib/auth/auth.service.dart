import 'dart:convert';

import 'package:vtv_new/auth/auth.model.dart';
import 'package:http/http.dart' as http;
import 'package:vtv_new/common/auth_token.model.dart';
import 'package:vtv_new/environments.dart';

class AuthService {
  const AuthService();

  // Future<http.Response> register_service (AuthRequestData auth_request_data) async {
  //   String url = 'international/test/';

  //   return http.get(Uri.parse(BASE_URL + url));
  // }

  Future<bool> register_service(AuthRequestData auth_request_data) async {
    String url = 'international/register/';

    final response = await http.post(Uri.parse(BASE_URL + url),
     body: {
      'email': auth_request_data.email,
      'password': auth_request_data.password
    });

    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed to test');
    }
  }

  Future<AuthData> login_service(AuthRequestData auth_request_data) async {
    String url = 'international/login/';

    final response = await http.post(Uri.parse(BASE_URL + url),
     body: {
      'email': auth_request_data.email,
      'password': auth_request_data.password
    });

    if (response.statusCode == 200) {
      return AuthData.fromJson(jsonDecode(response.body) as Map<String,dynamic>);
    } else {
      throw Exception('Failed to login');
    }
  }
}
