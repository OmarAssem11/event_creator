import 'package:event_creator/features/cars/data/models/car_model.dart';
import 'package:event_creator/features/cars/domain/entities/car_booking_data.dart';

abstract class CarsService {
  Future<List<CarModel>> getAllHalls();

  Future<void> rateCar({required String carId, required double rating});

  Future<void> bookCar(CarBookingData bookingData);
}
