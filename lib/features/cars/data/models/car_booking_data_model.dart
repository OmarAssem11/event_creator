class CarBookingDataModel {
  final String carId;
  final String startDate;
  final String endDate;

  const CarBookingDataModel({
    required this.carId,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() => {
        'car_id': carId,
        'start_date': startDate,
        'end_date': endDate,
      };
}
