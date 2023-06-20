import 'package:event_creator/features/cars/domain/entities/car.dart';

class CarsFilter {
  final DateTime startDate;
  final DateTime endDate;
  final String model;
  final double minPrice;
  final double maxPrice;

  const CarsFilter({
    required this.startDate,
    required this.endDate,
    required this.model,
    required this.minPrice,
    required this.maxPrice,
  });

  bool match(Car car) => _matchModel(car) && _matchPrice(car);

  bool _matchModel(Car car) => car.model == model;

  bool _matchPrice(Car car) => car.price >= minPrice && car.price <= maxPrice;
}
