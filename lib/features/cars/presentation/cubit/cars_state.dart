import 'package:event_creator/features/cars/domain/entities/car.dart';

abstract class CarsState {}

class CarsInitial extends CarsState {}

class CarsLoading extends CarsState {}

class CarsError extends CarsState {
  final String message;

  CarsError(this.message);
}

class GetAllCarsSuccess extends CarsState {
  final List<Car> cars;

  GetAllCarsSuccess(this.cars);
}
