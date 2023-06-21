class HallRatingDataModel {
  final String hallId;
  final double rating;

  const HallRatingDataModel({
    required this.hallId,
    required this.rating,
  });

  Map<String, dynamic> toJson() => {
        'hall_id': hallId,
        'rating': rating,
        'user_id': '1',
      };
}
