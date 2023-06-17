import 'package:event_creator/features/halls/domain/entities/hairdresser.dart';
import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/domain/entities/hall_booking_data.dart';
import 'package:event_creator/features/halls/domain/entities/hall_rating_data.dart';
import 'package:event_creator/features/halls/domain/entities/photographer.dart';

abstract class HallsRepository {
  Future<List<Hall>> getAllHalls();

  Future<List<Hall>> getOffersHalls();

  Future<List<Hairdresser>> getHairdressers();

  Future<List<Photographer>> getPhotographers();

  Future<void> rateHall(HallRatingData hallRatingData);

  Future<void> bookHall(HallBookingData hallBookingData);
}
