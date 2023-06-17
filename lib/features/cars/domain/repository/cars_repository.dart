import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/features/cars/domain/entities/car_booking_data.dart';
import 'package:event_creator/features/cars/domain/entities/car_rating_data.dart';

abstract class CarsRepository {
  Future<List<Car>> getAllCars();

  Future<void> rateCar(CarRatingData carRatingData);

  Future<void> bookCar(CarBookingData carBookingData);
}
