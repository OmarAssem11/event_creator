import 'package:event_creator/features/cars/domain/entities/car_rating_data.dart';
import 'package:event_creator/features/cars/domain/repository/cars_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RateCar {
  final CarsRepository _carsRepository;

  const RateCar(this._carsRepository);

  Future<void> call(CarRatingData carRatingData) =>
      _carsRepository.rateCar(carRatingData);
}
