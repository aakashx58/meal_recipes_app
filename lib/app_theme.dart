import 'package:flutter/material.dart';

ThemeData appTheme(context) {
  return ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: const Color.fromARGB(255, 255, 254, 229),
    fontFamily: "Raleway",
    textTheme: Theme.of(context).textTheme.copyWith(
          bodySmall: const TextStyle(
            color: Color.fromARGB(255, 20, 51, 51),
          ),
          bodyLarge: const TextStyle(
            color: Color.fromARGB(255, 20, 51, 51),
          ),
          bodyMedium: const TextStyle(
            color: Color.fromARGB(255, 20, 51, 51),
          ),
          titleLarge: const TextStyle(
            fontSize: 24,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold,
          ),
          titleMedium: const TextStyle(
            fontSize: 22,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold,
          ),
          titleSmall: const TextStyle(
            fontSize: 20,
            fontFamily: "RobotoCondensed",
            fontWeight: FontWeight.bold,
          ),
        ),
  );
}
