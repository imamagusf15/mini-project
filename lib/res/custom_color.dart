import 'package:flutter/material.dart';

class CustomColors {
  //static final Color primaryColor = Color(0xFFFEFFDE);
  static const MaterialColor primaryColor = MaterialColor(
    0xFFFEFFDE, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffFDFFD9), //10%
      100: Color(0xffECFA83), //20%
      200: Color(0xffDEEB77), //30%
      300: Color(0xffC2CF5E), //40%
      400: Color(0xffA7B346), //50%
      500: Color(0xff8C982D), //60%
      600: Color(0xff737D12), //70%
      700: Color(0xff5A6400), //80%
      800: Color(0xff444B00), //90%
      900: Color(0xff2E3300), //100%
    },
  );
  //static final Color secondaryColor = Color(0xFFDDFFBC);
  static const MaterialColor secondaryColor = MaterialColor(
    0xFFDDFFBC, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffD0FFA5), //10%
      100: Color(0xffBEF291), //20%
      200: Color(0xffA3D578), //30%
      300: Color(0xff89B95F), //40%
      400: Color(0xff6F9D48), //50%
      500: Color(0xff568331), //60%
      600: Color(0xff3E6919), //70%
      700: Color(0xff285000), //80%
      800: Color(0xff1A3700), //90%
      900: Color(0xff0C2000), //100%
    },
  );
  //static final Color tertiaryColor = Color(0xFF91C788);
  static const MaterialColor tertiaryColor = MaterialColor(
    0xFF91C788, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffACF4A2), //10%
      100: Color(0xff91D888), //20%
      200: Color(0xff77BB6F), //30%
      300: Color(0xff5DA057), //40%
      400: Color(0xff438540), //50%
      500: Color(0xff2A6B29), //60%
      600: Color(0xff0C5313), //70%
      700: Color(0xff003907), //80%
      800: Color(0xff002203), //90%
      900: Color(0xff000000), //100%
    },
  );

  static const MaterialColor neutralColor = MaterialColor(
    0xFF5F5F58, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffF3F1E8), //10%
      100: Color(0xffE5E2DA), //20%
      200: Color(0xffC9C6BE), //30%
      300: Color(0xffADABA4), //40%
      400: Color(0xff929189), //50%
      500: Color(0xff787770), //60%
      600: Color(0xff5F5F58), //70%
      700: Color(0xff474741), //80%
      800: Color(0xff31312B), //90%
      900: Color(0xff000000), //100%
    },
  );
}
