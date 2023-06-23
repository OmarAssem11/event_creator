class CarsSearchDataModel {
  final String startDate;
  final String endDate;
  final String brand;
  final String option;

  const CarsSearchDataModel({
    required this.startDate,
    required this.endDate,
    required this.brand,
    required this.option,
  });

  Map<String, dynamic> toJson() => {
        'start_date': startDate,
        'end_date': endDate,
        'brand': brand,
        'option': option,
      };
}
