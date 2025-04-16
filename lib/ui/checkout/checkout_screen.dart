
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/model/dish.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/app_fonts.dart';
import 'package:techtaste/ui/_core/cart_provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    
    if(cartProvider.cartDishesMap.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Carrinho", style: AppFonts.titleLarge),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 32,
            children: [
              const Icon(Icons.shopping_cart, size: 120, color: AppColors.primaryMediumColor),
              Text("Carrinho vazio", style: AppFonts.titleMedium),
            ],
          )
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho", style: AppFonts.titleLarge),
        actions: [
          TextButton(onPressed: () {
            cartProvider.clear();
          }, child: Text("limpar", style: AppFonts.labelMedium)),
        ],
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            spacing: 16,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Pedidos", 
                style: AppFonts.titleMedium.copyWith(color: AppColors.primaryMediumColor),
                textAlign: TextAlign.start,  
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    Dish dish = cartProvider.cartDishesMap.keys.elementAt(index);
                    return ListTile(
                      contentPadding: const EdgeInsets.all(0.0),
                      leading: Image.asset(
                        "assets/${dish.imagePath}", 
                        errorBuilder: (context, error, stackTrace) => 
                          Image.asset("assets/dishes/default.png"),
                      ),
                      title: Text(dish.name, style: AppFonts.bodySmall),
                      subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}", style: AppFonts.bodyMedium),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              cartProvider.remove(dish);
                            }, 
                            icon: const Icon(
                              Icons.remove_circle,
                              color: AppColors.primaryMediumColor,
                            ),
                          ),
                          Text(
                            cartProvider.cartDishesMap[dish].toString(), 
                            style: AppFonts.labelMedium,
                          ),
                          IconButton(
                            onPressed: () {
                              cartProvider.add(dish);
                            },
                            icon: const Icon(
                              Icons.add_circle,
                              color: AppColors.primaryMediumColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  }, 
                  separatorBuilder: (context, index) => const SizedBox(height: 8), 
                  itemCount: cartProvider.cartDishesMap.keys.length,
                ),
              ),
            ],
        ),
      ),
    );
  }
}