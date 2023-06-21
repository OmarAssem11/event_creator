class CarRatingDataModel {
  final String carId;
  final double rating;

  const CarRatingDataModel({
    required this.carId,
    required this.rating,
  });

  Map<String, dynamic> toJson() => {
        'car_id': carId,
        'rating': rating,
        'user_id': '1',
      };
}
