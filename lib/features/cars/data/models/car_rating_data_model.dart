class CarRatingDataModel {
  final String carId;
  final double rating;
  final int numOfRatings;

  const CarRatingDataModel({
    required this.carId,
    required this.rating,
    required this.numOfRatings,
  });

  Map<String, dynamic> toJson() => {
        'id': carId,
        'num_rate': rating,
        'sum_rate': numOfRatings,
      };
}
