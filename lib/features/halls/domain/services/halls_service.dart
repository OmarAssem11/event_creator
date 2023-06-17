import 'package:event_creator/features/halls/data/models/hairdresser_model.dart';
import 'package:event_creator/features/halls/data/models/hall_booking_data_model.dart';
import 'package:event_creator/features/halls/data/models/hall_model.dart';
import 'package:event_creator/features/halls/data/models/hall_rating_data_model.dart';
import 'package:event_creator/features/halls/data/models/photographer_model.dart';

abstract class HallsService {
  Future<List<HallModel>> getAllHalls();

  Future<List<HallModel>> getOffersHalls();

  Future<List<HairdresserModel>> getHairdressers();

  Future<List<PhotographerModel>> getPhotographers();

  Future<void> rateHall(HallRatingDataModel hallRatingDataModel);

  Future<void> bookHall(HallBookingDataModel hallBookingDataModel);
}
