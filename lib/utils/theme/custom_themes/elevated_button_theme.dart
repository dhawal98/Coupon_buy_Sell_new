import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.brown,

      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,

      side: const BorderSide(color: Colors.brown),
      padding: const EdgeInsets.symmetric(vertical: 18),

      textStyle: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );


  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.brown,

        disabledForegroundColor: Colors.grey,
        disabledBackgroundColor: Colors.grey,

        side: const BorderSide(color: Colors.brown),
        padding: const EdgeInsets.symmetric(vertical: 18),

        textStyle: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      )
  );
}