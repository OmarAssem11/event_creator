class HallModel {
  final String id;
  final String description;
  final String imageUrl;
  final double price;
  final int numOfPeoples;
  final double? rating;
  final int? numOfRatings;

  const HallModel({
    required this.id,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.numOfPeoples,
    this.rating,
    this.numOfRatings,
  });

  HallModel.fromJson(Map<String, dynamic> json)
      : this(
          id: (json['id'] as int).toString(),
          description: json['des'] as String,
          imageUrl: json['paths'] as String,
          price: (json['price'] as num).toDouble(),
          numOfPeoples: json['people_num'] as int,
          rating: json['num_rate'] != null
              ? (json['num_rate'] as num).toDouble()
              : null,
          numOfRatings:
              json['sum_rate'] != null ? json['sum_rate'] as int : null,
        );
}
