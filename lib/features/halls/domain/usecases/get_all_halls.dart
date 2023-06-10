import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllHalls {
  final HallsRepository _hallsRepository;

  const GetAllHalls(this._hallsRepository);

  Future<List<Hall>> call() => _hallsRepository.getAllHalls();
}
