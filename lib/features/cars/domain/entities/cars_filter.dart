import 'package:event_creator/features/cars/domain/entities/car.dart';

class CarsFilter {
  final String model;

  final double minPrice;
  final double maxPrice;

  const CarsFilter({
    required this.model,
    required this.minPrice,
    required this.maxPrice,
  });

  bool match(Car car) => _matchModel(car) && _matchPrice(car);

  bool _matchModel(Car car) => car.model == model;

  bool _matchPrice(Car car) => car.price >= minPrice && car.price <= maxPrice;
}
