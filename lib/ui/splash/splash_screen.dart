
import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/app_fonts.dart';

class SplashScreen extends StatelessWidget {
  
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/banners/banner_splash.png"),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                spacing: 32,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/logo.png", width: 192,),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Um parceiro para inovador para sua",
                      style: AppFonts.titleLarge,
                      children: <TextSpan>[
                        TextSpan(
                          text: " melhor experiência culinária!", 
                          style: AppFonts.titleLarge.copyWith(
                            color: AppColors.orangeMediumColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (){}, 
                      child: Text("Bora!", 
                        style: AppFonts.titleMedium.copyWith(
                          color: AppColors.backgroundColor,
                        ),
                      ),
                    ),
                  ),
              ]),
            ),
          ), 
        ],
      ),
    );
  }
}