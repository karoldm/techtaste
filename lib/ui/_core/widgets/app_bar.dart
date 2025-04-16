
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/ui/_core/app_fonts.dart';
import 'package:techtaste/ui/_core/cart_provider.dart';
import 'package:badges/badges.dart' as badges;

AppBar getAppBar({
  required BuildContext context,
  String? title,
  Widget? leading,
}) {
  CartProvider cartProvider = Provider.of<CartProvider>(context);

  return AppBar(
    title: Text(title ?? '', style: AppFonts.titleLarge),
    centerTitle: true,
    actions: [
      badges.Badge(
        showBadge: cartProvider.cartDishes.isNotEmpty,
        badgeContent: Text(
          cartProvider.cartDishes.length.toString(),
          style: AppFonts.labelSmall,
        ),
        position: badges.BadgePosition.topEnd(top: 0, end: 4),
        child: IconButton(onPressed: () {
          Navigator.pushNamed(context, "/checkout");
        }, icon: const Icon(Icons.shopping_cart)),
      )
    ],
    leading: leading,
  );
}