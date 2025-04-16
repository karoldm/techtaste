import 'package:techtaste/model/dish.dart';

class Restaurant {
  final String id;
  final String imagePath;
  final String name;
  final String description;
  final double stars;
  final int distance;
  final List<String> categories;
  final List<Dish> dishes;

  const Restaurant({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.stars,
    required this.distance,
    required this.categories,
    required this.dishes,
  });

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'imagePath': imagePath,
      'name': name,
      'description': description,
      'stars': stars,
      'distance': distance,
      'categories': categories,
      'dishes': dishes.map((dish) => dish.toMap()).toList(),
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
      imagePath: map['imagePath'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      stars: (map['stars'] as num).toDouble(),
      distance: map['distance'] as int,
      categories: List<String>.from(map['categories']),
      dishes: List.from(map['dishes'].map((dish) => Dish.fromMap(dish))),
    );
  }

  @override
  String toString() {
    return 'Restaurant(id: $id, imagePath: $imagePath, name: $name, description: $description, stars: $stars, distance: $distance, categories: $categories)';
  }
}