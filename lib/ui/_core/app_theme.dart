
import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';

abstract class AppTheme {
  static ThemeData appTheme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.orangeMediumColor),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(    
          foregroundColor: WidgetStateProperty.all(AppColors.backgroundColor),
          backgroundColor: WidgetStateColor.resolveWith(
            (state) {
              if (state.contains(WidgetState.disabled)) {
                return AppColors.grayBackgorundColor;
              }
              if (state.contains(WidgetState.pressed)) {
                return AppColors.orangeDarkColor;
              }
              return AppColors.orangeMediumColor;
            },
          ),
        )
      ),
  );
}