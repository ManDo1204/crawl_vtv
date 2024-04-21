import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vtv_new/common/auth_token.model.dart';
import 'package:vtv_new/common/list_new_model.dart';
import 'package:vtv_new/route.dart';
import 'auth/login.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Routes _routes = Routes();

  AuthData auth_data = AuthData(refresh: '', access: '');
  ListVTVNew list_vtv_new = ListVTVNew(list_vtv_new: []);

  @override
  Widget build(BuildContext context) {
    List<SingleChildWidget> providers = [
      Provider<AuthData>(create: (_) => auth_data),
      Provider<ListVTVNew>(create: (_) => list_vtv_new),
    ];
    return MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: _routes.routes,
          home: Login(),
        ));
  }
}
