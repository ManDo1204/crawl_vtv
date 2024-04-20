import 'package:flutter/material.dart';
import 'package:vtv_new/route.dart';
import 'auth/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Routes _routes = Routes();
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: _routes.routes,
      home: Login(),
    );
  }
}
