// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mini_project/utils/page_route.dart';
import 'package:mini_project/screen/wrapper_page.dart';
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
      routes: routes,
      home: const WrapperPage(),
    );
  }
}
