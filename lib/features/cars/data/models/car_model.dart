class CarModel {
  final String id;
  final String description;
  final String imageUrl;
  final double price;
  final double rating;
  final String brand;
  final String model;

  const CarModel({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.brand,
    required this.model,
  });

  CarModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          description: json['des'] as String,
          imageUrl: json['paths'] as String,
          price: double.parse(json['price'] as String),
          rating: double.parse(json['num_rate'] as String),
          brand: json['brand'] as String,
          model: json['model'] as String,
        );
}
