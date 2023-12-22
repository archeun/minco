import 'package:flutter/material.dart';

const primaryColor = Color(0xFF093d65);
const secondaryColor = Color(0xFF60d394);
const background = Color(0xFFf6f6f6);

class Minco {
  static final ThemeData defaultTheme = _buildMyTheme();

  static ThemeData _buildMyTheme() {
    final ThemeData base = ThemeData.light();

    return base.copyWith(
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(5),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(primaryColor),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        ),
      ),
      colorScheme: base.colorScheme.copyWith(
        primary: primaryColor,
        onPrimary: primaryColor,
        secondary: secondaryColor,
        onSecondary: secondaryColor,
      ),
    );
  }
}
