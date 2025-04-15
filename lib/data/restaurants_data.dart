
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:techtaste/model/restaurant.dart';

class RestaurantsData extends ChangeNotifier {
  List<Restaurant> listRestaurants = [];

  Future<void> getRestaurants() async {

    String jsonString = await rootBundle.loadString("assets/data.json");
    
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    for (var restaurant in jsonMap["restaurants"]) {
      listRestaurants.add(Restaurant.fromMap(restaurant));
    }
  }
}