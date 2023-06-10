import 'package:event_creator/features/cars/domain/entities/car.dart';

abstract class CarsRepository {
  Future<List<Car>> getAllCars();
}
