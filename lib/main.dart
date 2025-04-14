import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_theme.dart';
import 'package:techtaste/ui/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tech Taste',
      theme: AppTheme.appTheme,
      home: const SplashScreen(),
    );
  }
}
