import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techtaste/data/restaurants_data.dart';
import 'package:techtaste/model/restaurant.dart';
import 'package:techtaste/ui/_core/app_theme.dart';
import 'package:techtaste/ui/checkout/checkout_screen.dart';
import 'package:techtaste/ui/home/home_screen.dart';
import 'package:techtaste/ui/restaurant/restaurant_screen.dart';
import 'package:techtaste/ui/splash/splash_screen.dart';

import 'ui/_core/cart_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final RestaurantsData restaurantsData = RestaurantsData();
  await restaurantsData.getRestaurants();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<RestaurantsData>(
      create: (context) => restaurantsData,
    ),
    ChangeNotifierProvider<CartProvider>(
      create: (context) => CartProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tech Taste',
      theme: AppTheme.appTheme,
      home: const SplashScreen(),
      routes: {
        "/home": (context) => const HomeScreen(),
        "/restaurant": (context) => RestaurantScreen(
              restaurant: ModalRoute.of(context)!.settings.arguments as Restaurant,
            ),
        "/checkout": (context) => CheckoutScreen(),
      },
    );
  }
}
