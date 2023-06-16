import 'package:event_creator/features/cars/data/models/car_model.dart';

abstract class CarsService {
  Future<List<CarModel>> getAllHalls();

  Future<void> rateCar(double rating);
}
