import 'package:event_creator/features/halls/domain/entities/hall_rating_data.dart';
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RateHall {
  final HallsRepository _hallsRepository;

  const RateHall(this._hallsRepository);

  Future<void> call(HallRatingData hallRatingData) =>
      _hallsRepository.rateHall(hallRatingData);
}
