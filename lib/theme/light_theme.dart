import 'package:flutter/material.dart';

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.yellow.shade300,
);
final defaultTheme = ThemeData.light();
final lightTheme = defaultTheme.copyWith(
  colorScheme: lightColorScheme,
  appBarTheme: AppBarTheme().copyWith(
    backgroundColor: lightColorScheme.primaryContainer,
    foregroundColor: lightColorScheme.onPrimaryContainer,
  ),
  tabBarTheme: TabBarTheme().copyWith(
    indicatorColor: lightColorScheme.error,
    labelColor: lightColorScheme.error,
    unselectedLabelColor: lightColorScheme.onPrimaryContainer,
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusColor: lightColorScheme.surface,
    labelStyle: TextStyle(color: lightColorScheme.onSurface, fontSize: 22),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.surface, width: 4),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.surface, width: 4),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: lightColorScheme.onSurface, width: 4),
    ),
  ),

  scaffoldBackgroundColor: lightColorScheme.inversePrimary,
  cardTheme: CardTheme().copyWith(color: lightColorScheme.surface),
);
