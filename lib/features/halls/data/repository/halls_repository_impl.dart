import 'package:event_creator/features/auth/domain/entities/phone_number.dart';
import 'package:event_creator/features/halls/data/models/hairdresser_model.dart';
import 'package:event_creator/features/halls/data/models/hall_model.dart';
import 'package:event_creator/features/halls/data/models/photographer_model.dart';
import 'package:event_creator/features/halls/domain/entities/hairdresser.dart';
import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/domain/entities/photographer.dart';
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart';
import 'package:event_creator/features/halls/domain/services/halls_service.dart';
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
}

extension HallMapper on HallModel {
  Hall get toEntity => Hall(
        id: id,
        description: description,
        imageUrl: imageUrl,
        price: price,
        rating: rating,
        numOfPeople: numOfPeople,
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
