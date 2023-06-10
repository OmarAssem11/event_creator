import 'package:event_creator/features/halls/data/models/hall_model.dart';
import 'package:event_creator/features/halls/domain/entities/hall.dart';
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
}

extension HallMapper on HallModel {
  Hall get toEntity => Hall(
        id: id,
        description: description,
        imageUrl: imageUrl,
        numOfPeople: numOfPeople,
        price: price,
      );
}
