class CarRatingDataModel {
  final String carId;
  final double rating;

  const CarRatingDataModel({
    required this.carId,
    required this.rating,
  });

  Map<String, dynamic> toJson() => {
        'id': carId,
        'num_rate': rating,
        'sum_rate': '5',
      };
}
