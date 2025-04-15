
import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';

abstract class AppFonts {
  static TextStyle titleLarge = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 22,
    fontWeight: FontWeight.normal,
    color: AppColors.grayTextColor,
  );

  static TextStyle titleMedium = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.grayTextColor,
  );

    static TextStyle titleSmall = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.grayTextColor,
  );

  static TextStyle bodyLarge = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.grayTextColor,
  );

  static TextStyle bodyMedium = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.grayTextColor,
  );

    static TextStyle bodySmall = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.grayTextColor,
  );

  static TextStyle labelLarge = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.grayTextColor,
  );

  static TextStyle labelMedium = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColors.grayTextColor,
  );

    static TextStyle labelSmall = const TextStyle(
    fontFamily: 'Roboto',
    fontSize: 11,
    fontWeight: FontWeight.w500,
    color: AppColors.grayTextColor,
  );
}