class HallModel {
  final String id;
  final String description;
  final String imageUrl;
  final int numOfPeople;
  final double price;
  final double? rating;

  const HallModel({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.numOfPeople,
    required this.price,
    this.rating,
  });

  HallModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          description: json['des'] as String,
          imageUrl: json['paths'] as String,
          numOfPeople: int.parse(json['people_num'] as String),
          price: double.parse(json['price'] as String),
          rating: json['num_rate'] != null
              ? double.parse(json['num_rate'] as String)
              : null,
        );
}
