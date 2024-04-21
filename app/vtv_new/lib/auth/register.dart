import 'package:flutter/material.dart';
import 'package:vtv_new/auth/auth.bloc.dart';
import 'package:vtv_new/auth/auth.model.dart';
import 'package:vtv_new/auth/login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  static const String routeName = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthBloc auth_bloc = AuthBloc();
  AuthRequestData request_data = AuthRequestData();

  final email_controller = TextEditingController();
  final pw_controller = TextEditingController();
  final re_pw_controller = TextEditingController();

  String error_message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: email_controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com'),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextField(
              controller: pw_controller,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter secure password'),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 15, bottom: 0),
            child: TextField(
              controller: re_pw_controller,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter password again'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
              child: Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 62),
                  child: Text("Already have account - "),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 1.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Login.routeName);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 14, color: Colors.blue),
                      )),
                )
              ],
            ),
          )),
          SizedBox(
            height: 65,
            width: 360,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  child: Text(
                    'Register ',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () {
                    register();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              error_message,
              style: const TextStyle(color: Colors.red),
            ),
          )
        ],
      ),
    );
  }

  Future<void> register() async {
    if (pw_controller.text != re_pw_controller.text) {
      print('Confirm password does not match. Try again!');
      if (mounted) {
        setState(() {
          error_message = 'Confirm password does not match. Try again!';
        });
      }
    } else if (pw_controller.text == null || pw_controller.text.length < 6) {
      print('Invalid password. Try again!');
      if (mounted) {
        setState(() {
          error_message = 'Invalid password. Try again!';
        });
      }
    } else if (!email_controller.text.contains('@')) {
      print('Invalid email');
      if (mounted) {
        setState(() {
          error_message = 'Invalid email';
        });
      }
    } else {
      request_data.email = email_controller.text;
      request_data.password = pw_controller.text;
      await auth_bloc.register_bloc(request_data);
      print('Register success!');
      Navigator.pushNamed(context, Login.routeName);
    }
  }
}
