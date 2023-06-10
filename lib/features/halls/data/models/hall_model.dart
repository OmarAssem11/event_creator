class HallModel {
  final String id;
  final String description;
  final String imageUrl;
  final int numOfPeople;
  final double price;

  const HallModel({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.numOfPeople,
    required this.price,
  });

  HallModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'] as String,
          description: json['des'] as String,
          imageUrl: json['paths'] as String,
          numOfPeople: int.parse(json['people_num'] as String),
          price: double.parse(json['price'] as String),
        );
}