
import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';

abstract class AppTheme {

  static ThemeData appTheme = ThemeData.dark().copyWith(
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primaryMediumColor, 
        selectionColor: AppColors.primaryDarkColor,
        selectionHandleColor: AppColors.primaryDarkColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardBackgorundColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        iconTheme: IconThemeData(
          color: AppColors.grayTextColor,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(    
          foregroundColor: WidgetStateProperty.all(AppColors.backgroundColor),
          backgroundColor: WidgetStateColor.resolveWith(
            (state) {
              if (state.contains(WidgetState.disabled)) {
                return AppColors.cardBackgorundColor;
              }
              if (state.contains(WidgetState.pressed)) {
                return AppColors.primaryDarkColor;
              }
              return AppColors.primaryMediumColor;
            },
          ),
        )
      ),
  );
}