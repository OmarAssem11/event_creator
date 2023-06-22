import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/features/cars/domain/entities/car_brand.dart';
import 'package:event_creator/features/cars/domain/entities/car_option.dart';

class CarsFilter {
  final DateTime startDate;
  final DateTime endDate;
  final CarBrand brand;
  final CarOption option;
  final double minPrice;
  final double maxPrice;

  const CarsFilter({
    required this.startDate,
    required this.endDate,
    required this.brand,
    required this.option,
    required this.minPrice,
    required this.maxPrice,
  });

  bool match(Car car) => _matchBrand(car) && _matchPrice(car);

  bool _matchBrand(Car car) => car.brand == brand;

  bool _matchPrice(Car car) => car.price >= minPrice && car.price <= maxPrice;
}
