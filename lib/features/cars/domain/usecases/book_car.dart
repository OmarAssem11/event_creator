import 'package:event_creator/features/cars/domain/entities/car_booking_data.dart';
import 'package:event_creator/features/cars/domain/repository/cars_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BookCar {
  final CarsRepository _carsRepository;

  const BookCar(this._carsRepository);

  Future<void> call(CarBookingData carBookingData) =>
      _carsRepository.bookCar(carBookingData);
}
