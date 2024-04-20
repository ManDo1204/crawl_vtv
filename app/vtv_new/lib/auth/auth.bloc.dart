import 'package:flutter/material.dart';
import 'package:vtv_new/auth/auth.model.dart';
import 'package:vtv_new/auth/auth.service.dart';

class AuthBloc {
  const AuthBloc();

  Future<String> register_bloc(AuthRequestData auth_request_data) async {
    final AuthService service = AuthService();
    try {
      var response_data = await service.register_service(auth_request_data);
    } on Exception catch (e) {
      print(e);
      return "Server error!";
    }

    return 'Register success';
  }

  Future<String> login_bloc(AuthRequestData auth_request_data) async {
    final AuthService service = AuthService();
    AuthData? response_data;
    try {
      response_data = await service.login_service(auth_request_data);
    } on Exception catch (e) {
      print(e);
      return "Server error!";
    }

    String access_token = response_data.access;

    return access_token;
  }
}
