import 'package:event_creator/features/auth/domain/entities/phone_number.dart';
import 'package:event_creator/features/halls/data/models/hairdresser_model.dart';
import 'package:event_creator/features/halls/data/models/hall_booking_data_model.dart';
import 'package:event_creator/features/halls/data/models/hall_model.dart';
import 'package:event_creator/features/halls/data/models/hall_rating_data_model.dart';
import 'package:event_creator/features/halls/data/models/photographer_model.dart';
import 'package:event_creator/features/halls/domain/entities/hairdresser.dart';
import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/domain/entities/hall_booking_data.dart';
import 'package:event_creator/features/halls/domain/entities/hall_rating_data.dart';
import 'package:event_creator/features/halls/domain/entities/photographer.dart';
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart';
import 'package:event_creator/features/halls/domain/services/halls_service.dart';
import 'package:event_creator/utils/helper_methods.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HallsRepository)
class HallsRepositoryImpl implements HallsRepository {
  final HallsService _hallsService;

  const HallsRepositoryImpl(this._hallsService);

  @override
  Future<List<Hall>> getAllHalls() async {
    final hallsModels = await _hallsService.getAllHalls();
    return hallsModels.map((hallModel) => hallModel.toEntity).toList();
  }

  @override
  Future<List<Hall>> getOffersHalls() async {
    final hallsModels = await _hallsService.getOffersHalls();
    return hallsModels.map((hallModel) => hallModel.toEntity).toList();
  }

  @override
  Future<List<Hairdresser>> getHairdressers() async {
    final hairdressersModels = await _hallsService.getHairdressers();
    return hairdressersModels
        .map((hairdresserModel) => hairdresserModel.toEntity)
        .toList();
  }

  @override
  Future<List<Photographer>> getPhotographers() async {
    final photographersModels = await _hallsService.getPhotographers();
    return photographersModels
        .map((photographerModel) => photographerModel.toEntity)
        .toList();
  }

  @override
  Future<void> rateHall(HallRatingData hallRatingData) async =>
      _hallsService.rateHall(hallRatingData.fromEntity);

  @override
  Future<void> bookHall(HallBookingData hallBookingData) async =>
      _hallsService.bookHall(hallBookingData.fromEntity);
}

extension HallMapper on HallModel {
  Hall get toEntity => Hall(
        id: id,
        description: description,
        imageUrl: imageUrl,
        price: price,
        rating: rating,
        numOfRatings: numOfRatings,
        numOfPeoples: numOfPeoples,
      );
}

extension HairdresserMapper on HairdresserModel {
  Hairdresser get toEntity => Hairdresser(
        id: id,
        description: description,
        imageUrl: imageUrl,
        price: price,
        phoneNumber: PhoneNumber(countryCode: '+20', number: phoneNumber),
      );
}

extension PhotographerMapper on PhotographerModel {
  Photographer get toEntity => Photographer(
        id: id,
        description: description,
        imageUrl: imageUrl,
        price: price,
        phoneNumber: PhoneNumber(countryCode: '+20', number: phoneNumber),
      );
}

extension HallRatingDataModelMapper on HallRatingData {
  HallRatingDataModel get fromEntity => HallRatingDataModel(
        hallId: hallId,
        rating: rating,
        numOfRatings: numOfRatings,
      );
}

extension HallBookingDataModelMapper on HallBookingData {
  HallBookingDataModel get fromEntity => HallBookingDataModel(
        hallId: hallId,
        date: formatDateTime(date),
        eventType: eventType.text,
        hairdresserId: hairdresserId,
        photographerId: photographerId,
      );
}
