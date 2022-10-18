// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mini_project/screen/detail_menu_page.dart';
import 'package:mini_project/screen/forget_page.dart';
import 'package:mini_project/screen/home_page.dart';
import 'package:mini_project/screen/login_page.dart';
import 'package:mini_project/screen/order_page.dart';
import 'package:mini_project/screen/register_page.dart';
import 'res/custom_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: CustomColors.tertiaryColor,
        scaffoldBackgroundColor: CustomColors.primaryColor,
      ),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        RegisterPage.routeName: (context) => RegisterPage(),
        LoginPage.routeName: (context) => LoginPage(),
        HomePage.routeName: (context) => HomePage(),
        ForgetPage.routeName: (context) => ForgetPage(),
        DetailMenuPage.routeName: (context) => DetailMenuPage(),
        OrderPage.routeName: (context) => OrderPage(),
      },
    );
  }
}
