class HallRatingDataModel {
  final String hallId;
  final double rating;
  final int numOfRatings;

  const HallRatingDataModel({
    required this.hallId,
    required this.rating,
    required this.numOfRatings,
  });

  Map<String, dynamic> toJson() => {
        'id': hallId,
        'num_rate': rating,
        'sum_rate': numOfRatings,
      };
}
