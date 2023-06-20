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
          id: (json['id'] as int).toString(),
          description: json['des'] as String,
          imageUrl: json['paths'] as String,
          price: (json['price'] as num).toDouble(),
          numOfPeople: json['people_num'] as int,
          rating: json['num_rate'] != null
              ? (json['num_rate'] as num).toDouble()
              : null,
        );
}
