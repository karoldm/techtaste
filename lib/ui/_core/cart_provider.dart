
import 'package:flutter/material.dart';
import 'package:techtaste/model/dish.dart';

class CartProvider extends ChangeNotifier {
  final List<Dish> cartDishes = [];

  void addAll(List<Dish> dishes) {
    cartDishes.addAll(dishes);
    notifyListeners();
  }

  void add(Dish dish) {
    cartDishes.add(dish);
    notifyListeners();
  }

  void remove(Dish dish) {
    cartDishes.remove(dish);
    notifyListeners();
  }

  void clear() {
    cartDishes.clear();
    notifyListeners();
  }

  Map<Dish, int> get cartDishesMap {
    Map<Dish, int> map = {};

    for (var dish in cartDishes) {
      map[dish] = (map[dish] ?? 0) + 1;
    }

    return map;
  }

  double get totalPrice {
    double total = 0;
    for (var dish in cartDishes) {
      total += dish.price;
    }
    return total;
  }
}