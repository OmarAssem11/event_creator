import 'package:event_creator/features/halls/domain/entities/hall_booking_data.dart';
import 'package:event_creator/features/halls/domain/services/halls_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BookHall {
  final HallsService _hallsService;

  const BookHall(this._hallsService);

  Future<void> call(HallBookingData bookingData) =>
      _hallsService.bookHall(bookingData);
}
