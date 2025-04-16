
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/model/dish.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/app_fonts.dart';
import 'package:techtaste/ui/_core/cart_provider.dart';
import 'package:techtaste/ui/checkout/widgets/info_card.dart';

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
          child: SingleChildScrollView(
            child: Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Pedidos", 
                  style: AppFonts.titleMedium.copyWith(color: AppColors.primaryMediumColor),
                  textAlign: TextAlign.start,  
                ),
                ...List.generate(cartProvider.cartDishesMap.keys.length, (index) {
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
                ),
                Text(
                  "Pagamento", 
                  style: AppFonts.titleMedium.copyWith(color: AppColors.primaryMediumColor),
                  textAlign: TextAlign.start,  
                ),
                InfoCard(
                  leading: Image.asset("assets/others/visa.png", width: 48),
                  onTap: (){},
                  text: "VISA Classic  -  ****-0854",
                ),
                Text(
                  "Endereço", 
                  style: AppFonts.titleMedium.copyWith(color: AppColors.primaryMediumColor),
                  textAlign: TextAlign.start,  
                ),
                InfoCard(
                  leading: const Icon(Icons.pin_drop),
                  onTap: (){},
                  text: "Rua das Acácias, 28 - São Paulo - SP",
                ),
                Text(
                  "Confirmar", 
                  style: AppFonts.titleMedium.copyWith(color: AppColors.primaryMediumColor),
                  textAlign: TextAlign.start,  
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      spacing: 8,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pedido", style: AppFonts.bodyMedium),
                            Text(
                              "R\$ ${cartProvider.totalPrice.toStringAsFixed(2)}",
                              style: AppFonts.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Taxa de entrega", style: AppFonts.bodyMedium),
                            Text(
                              "R\$ 5,00",
                              style: AppFonts.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total", style: AppFonts.bodyMedium),
                            Text(
                              "R\$ ${(cartProvider.totalPrice + 5).toStringAsFixed(2)}",
                              style: AppFonts.bodyMedium,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 8,
                            children: [
                              const Icon(
                                Icons.account_balance_wallet_rounded, 
                                color: AppColors.cardBackgorundColor,
                                size: 24,
                              ),
                              Text("Pedir", 
                                style: AppFonts.labelLarge.copyWith(
                                  color: AppColors.cardBackgorundColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
      ),
    );
  }
}