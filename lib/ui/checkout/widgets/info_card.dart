
import 'package:flutter/material.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/app_fonts.dart';

class InfoCard extends StatelessWidget {
  final Widget leading;
  final Function onTap;
  final String text;

  const InfoCard({
    super.key,
    required this.leading,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      color: AppColors.cardBackgorundColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          spacing: 16,
          children: [
            leading,
            Expanded(child: Text(text, style: AppFonts.bodySmall)),
            IconButton(
              color: AppColors.primaryDarkColor,
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () => onTap(),
            ),
          ],
        ),
      ),
    );
  }

}