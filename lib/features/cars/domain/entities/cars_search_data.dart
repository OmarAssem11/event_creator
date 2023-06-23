import 'package:event_creator/features/cars/domain/entities/car_brand.dart';
import 'package:event_creator/features/cars/domain/entities/car_option.dart';

class CarsSearchData {
  final DateTime startDate;
  final DateTime endDate;
  final CarBrand brand;
  final CarOption option;

  const CarsSearchData({
    required this.startDate,
    required this.endDate,
    required this.brand,
    required this.option,
  });
}
