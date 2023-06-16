import 'package:event_creator/features/cars/domain/entities/car_booking_data.dart';
import 'package:event_creator/features/cars/domain/services/cars_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BookCar {
  final CarsService _carsService;

  const BookCar(this._carsService);

  Future<void> call(CarBookingData bookingData) =>
      _carsService.bookCar(bookingData);
}
