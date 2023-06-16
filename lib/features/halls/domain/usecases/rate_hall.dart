import 'package:event_creator/features/halls/domain/services/halls_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RateHall {
  final HallsService _hallsService;

  const RateHall(this._hallsService);

  Future<void> call({
    required String hallId,
    required double rating,
  }) =>
      _hallsService.rateHall(hallId: hallId, rating: rating);
}
