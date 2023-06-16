class HallModel {
  final String id;
  final String description;
  final String imageUrl;
  final double price;
  final int numOfPeople;
  final double? rating;

  const HallModel({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.numOfPeople,
    this.rating,
  });

  HallModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          description: json['des'] as String,
          imageUrl: json['paths'] as String,
          price: double.parse(json['price'] as String),
          numOfPeople: int.parse(json['people_num'] as String),
          rating: json['num_rate'] != null
              ? double.parse(json['num_rate'] as String)
              : null,
        );
}
