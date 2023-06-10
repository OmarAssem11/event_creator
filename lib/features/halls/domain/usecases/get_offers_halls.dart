import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetOffersHalls {
  final HallsRepository _hallsRepository;

  const GetOffersHalls(this._hallsRepository);

  Future<List<Hall>> call() => _hallsRepository.getOffersHalls();
}
