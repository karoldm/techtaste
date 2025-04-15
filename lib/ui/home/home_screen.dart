
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/data/categories_data.dart';
import 'package:techtaste/data/restaurants_data.dart';
import 'package:techtaste/ui/_core/app_colors.dart';
import 'package:techtaste/ui/_core/app_fonts.dart';
import 'package:techtaste/ui/home/widgets/category_widget.dart';
import 'package:techtaste/ui/home/widgets/restaurant_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    RestaurantsData restaurantsData = Provider.of<RestaurantsData>(context);

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart), onPressed: (){}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 32,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset("assets/logo.png", width: 147)),
              Text("Boas vindas!", 
                style: AppFonts.titleLarge.copyWith(color: AppColors.primaryMediumColor)),
              const TextField(
                decoration: InputDecoration(
                  hintText: "O que você deseja comer?",
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
              Text("Escolha por categoria", style: AppFonts.titleMedium),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 16,
                  children: List.generate(
                    CategoriesData.categories.length,
                    (index) => CategoryWidget(
                      name: CategoriesData.categories[index],
                    ),
                  ),
                ),
              ),
              Image.asset("assets/banners/banner_promo.png"),
              Text("Bem avaliados", style: AppFonts.titleMedium),
              Column(
                spacing: 16,
                children: List.generate(
                  restaurantsData.listRestaurants.length,
                  (index) => RestaurantWidget(
                    restaurant: restaurantsData.listRestaurants[index],
                  ),
                ),
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}