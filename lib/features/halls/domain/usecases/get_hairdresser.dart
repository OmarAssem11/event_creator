import 'package:event_creator/features/halls/domain/entities/hairdresser.dart';
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetHairdressers {
  final HallsRepository _hallsRepository;

  const GetHairdressers(this._hallsRepository);

  Future<List<Hairdresser>> call() => _hallsRepository.getHairdressers();
}
