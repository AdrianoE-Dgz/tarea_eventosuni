//ThemeData
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme{
    final colorScheme = ColorScheme.fromSeed(
      seedColor: Colors.teal
    );
    
    return ThemeData(
      colorScheme: colorScheme,

      scaffoldBackgroundColor: 
        colorScheme.surface,
      
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontWeight: FontWeight.bold,
        ),

        titleSmall: TextStyle(
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),

        titleLarge: TextStyle(
          fontWeight: FontWeight.w700,
        ),

        headlineLarge: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 25,
        )
      ),
    );
  }
}

