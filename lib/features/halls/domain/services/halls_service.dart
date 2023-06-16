import 'package:event_creator/features/halls/data/models/hall_model.dart';

abstract class HallsService {
  Future<List<HallModel>> getAllHalls();

  Future<List<HallModel>> getOffersHalls();

  Future<void> rateHall(double rating);
}
