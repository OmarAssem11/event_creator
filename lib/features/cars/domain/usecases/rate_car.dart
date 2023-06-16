import 'package:event_creator/features/cars/domain/services/cars_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RateCar {
  final CarsService _carsService;

  const RateCar(this._carsService);

  Future<void> call({
    required String carId,
    required double rating,
  }) =>
      _carsService.rateCar(carId: carId, rating: rating);
}
