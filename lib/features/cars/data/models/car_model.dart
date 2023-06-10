class CarModel {
  final String id;
  final String description;
  final String imageUrl;
  final String brand;
  final String model;
  final double price;

  const CarModel({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.brand,
    required this.model,
    required this.price,
  });

  CarModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          description: json['des'] as String,
          imageUrl: json['paths'] as String,
          brand: json['brand'] as String,
          model: json['model'] as String,
          price: double.parse(json['price'] as String),
        );
}
