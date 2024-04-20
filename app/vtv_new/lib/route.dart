import 'package:flutter/material.dart';
import 'package:vtv_new/auth/login.dart';
import 'package:vtv_new/auth/register.dart';
import 'package:vtv_new/home/home.dart';


class Routes {
  Routes() {
    _routes = {
      Login.routeName:(context) => Login(),
      Register.routeName:(context) => Register(),
      HomeScreen.routeName:(context) => HomeScreen(),

    };
  }

  late Map<String, WidgetBuilder> _routes;
  Map<String, WidgetBuilder> get routes => _routes;
}