class HallRatingDataModel {
  final String hallId;
  final double rating;

  const HallRatingDataModel({
    required this.hallId,
    required this.rating,
  });

  Map<String, dynamic> toJson() => {
        'id': hallId,
        'num_rate': rating,
        'sum_rate': '5',
      };
}
