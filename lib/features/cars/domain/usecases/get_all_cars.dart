import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/features/cars/domain/repository/cars_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllCars {
  final CarsRepository _carsRepository;

  const GetAllCars(this._carsRepository);

  Future<List<Car>> call() => _carsRepository.getAllCars();
}
