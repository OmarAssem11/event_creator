class HairdresserModel {
  final String id;
  final String description;
  final String imageUrl;
  final double price;
  final String phoneNumber;

  const HairdresserModel({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.phoneNumber,
  });

  HairdresserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          description: json['des'] as String,
          imageUrl: json['paths'] as String,
          price: double.parse(json['price'] as String),
          phoneNumber: json['phone'] as String,
        );
}
