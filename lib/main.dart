import 'package:flutter/material.dart';
import 'package:login_app/view/home.dart';
import 'package:login_app/view/login.dart';
import 'package:login_app/view/signin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "login",
      routes: {
        "login": (context) => const LogIn(),
        "sinup": (context) => const Signup(),
        "home": (context) => const Home(),
      },
    );
  }
}
