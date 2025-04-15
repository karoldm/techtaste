
import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/app_fonts.dart';

class CategoryWidget extends StatelessWidget {
  final String name;

  const CategoryWidget({
    super.key,
    required this.name,
  });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackgorundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: 88,
      height: 88,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/categories/${name.toLowerCase()}.png",
            width: 48,
            height: 48,
          ),
          Text(name, style: AppFonts.bodySmall),
        ],
      )
    );
  }
}