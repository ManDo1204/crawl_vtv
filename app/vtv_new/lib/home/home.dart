import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key} );

  // final String access_token;

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Title(
            title: 'International news', 
            color: Colors.blue,
            child: const Text('International news'),
          ),
          automaticallyImplyLeading: false,
        )));
  }
}