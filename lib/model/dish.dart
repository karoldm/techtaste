
class Dish {
  final String id;
  final String name;
  final String description;
  final num price;
  final String imagePath;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });

  factory Dish.fromMap(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
    };
  }

  @override
  String toString() {
    return 'Dish{name: $name, description: $description, price: $price, imagePath: $imagePath}';
  }
}