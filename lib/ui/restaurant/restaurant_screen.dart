
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/model/dish.dart';
import 'package:techtaste/model/restaurant.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/app_fonts.dart';
import 'package:techtaste/ui/_core/cart_provider.dart';
import 'package:techtaste/ui/_core/widgets/app_bar.dart';

class RestaurantScreen extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantScreen({super.key, required this.restaurant});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context: context, title: restaurant.name),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: Column(
            spacing: 16,
            children: [
              Image.asset(
                "assets/${restaurant.imagePath}", width: 160),
              Text("Mais pedidos", style: 
                AppFonts.titleMedium.copyWith(color: AppColors.primaryMediumColor),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    Dish dish = restaurant.dishes[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      leading: Image.asset(
                        "assets/${dish.imagePath}", 
                        errorBuilder: (context, error, stackTrace) => 
                          Image.asset("assets/dishes/default.png"),
                      ),
                      title: Text(dish.name),
                      subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.add_circle),
                        onPressed: () {
                          context.read<CartProvider>().addAll([dish]);
                        },
                      ),
                    ); 
                  },
                  separatorBuilder: (context, index) => 
                    SizedBox(height: index == 0 ? 0 : 8), 
                  itemCount: restaurant.dishes.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}