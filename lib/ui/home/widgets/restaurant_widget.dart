
import 'package:flutter/material.dart';
import 'package:techtaste/model/restaurant.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/app_fonts.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantWidget({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Image.asset("assets/${restaurant.imagePath}",
          width: 88,
          height: 88,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(restaurant.name, 
              style: AppFonts.titleSmall.copyWith(color: AppColors.primaryMediumColor)),
            Row(
              children: List.generate(restaurant.stars.toInt(), (index) {
                  return const Icon(Icons.star, color: Colors.amber);
                }),
            ),
            Text('${restaurant.distance}km', style: AppFonts.titleSmall),
          ],
        ),
      ],
    );
  }
}