import 'package:event_creator/features/cars/data/models/car_booking_data_model.dart';
import 'package:event_creator/features/cars/data/models/car_model.dart';
import 'package:event_creator/features/cars/data/models/car_rating_data_model.dart';
import 'package:event_creator/features/cars/data/models/cars_search_data_model.dart';

abstract class CarsService {
  Future<List<CarModel>> getAllCars();

  Future<List<CarModel>> searchCars(CarsSearchDataModel carsSearchDataModel);

  Future<void> rateCar(CarRatingDataModel carRatingDataModel);

  Future<void> bookCar(CarBookingDataModel carBookingDataModel);
}
