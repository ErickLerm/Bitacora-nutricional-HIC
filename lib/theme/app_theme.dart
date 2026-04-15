import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.background,

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor:  AppColors.primary,
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFFFFD6D6),
    ),

    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: AppColors.primary,
      selectedIconTheme: IconThemeData(color: Colors.white,),
      unselectedIconTheme: IconThemeData(color: Color(0xFFFFD6D6),),
      selectedLabelTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,),
      unselectedLabelTextStyle: TextStyle(color: Color(0xFFFFD6D6),),

      useIndicator: true,
      indicatorColor: Color(0x1A000000), // ligero fondo seleccionado
    ),
  );
}