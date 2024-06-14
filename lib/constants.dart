import 'package:flutter/material.dart';

Color violy1 = Color.fromARGB(255, 85, 98, 210);
Color violy2 = Color.fromARGB(255, 37, 93, 203);
Color whyte1 = Colors.white;
Color whyte2 = const Color.fromARGB(183, 221, 217, 217);

final ElevatedButtonThemeData kElevatedButtonStyle = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: whyte1, backgroundColor: violy1, // text color
    elevation: 10, // elevation
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // rounded corners
    ),
    padding:
        const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // padding
  ),
);
