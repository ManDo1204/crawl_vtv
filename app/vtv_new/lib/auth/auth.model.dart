import 'package:flutter/material.dart';


class AuthRequestData {
  String email = '';
  String password = '';
}

class AuthData {
  final String refresh;
  final String access;

  const AuthData({required this.refresh, required this.access});

  factory AuthData.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'refresh': String refresh,
        'access': String access,
      } =>
        AuthData(
          refresh: refresh,
          access: access,
        ),
      _ => throw const FormatException('Failed to login.'),
    };
  }
}
