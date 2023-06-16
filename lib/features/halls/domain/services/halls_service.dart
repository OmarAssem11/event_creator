import 'package:event_creator/features/halls/data/models/hairdresser_model.dart';
import 'package:event_creator/features/halls/data/models/hall_model.dart';
import 'package:event_creator/features/halls/data/models/photographer_model.dart';
import 'package:event_creator/features/halls/domain/entities/hall_booking_data.dart';

abstract class HallsService {
  Future<List<HallModel>> getAllHalls();

  Future<List<HallModel>> getOffersHalls();

  Future<List<HairdresserModel>> getHairdressers();

  Future<List<PhotographerModel>> getPhotographers();

  Future<void> rateHall({required String hallId, required double rating});

  Future<void> bookHall(HallBookingData bookingData);
}
