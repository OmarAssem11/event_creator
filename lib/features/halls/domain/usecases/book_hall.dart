import 'package:event_creator/features/halls/domain/entities/hall_booking_data.dart';
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class BookHall {
  final HallsRepository _hallsRepository;

  const BookHall(this._hallsRepository);

  Future<void> call(HallBookingData hallBookingData) =>
      _hallsRepository.bookHall(hallBookingData);
}
