import 'package:event_creator/features/halls/domain/entities/photographer.dart';
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetPhotographers {
  final HallsRepository _hallsRepository;

  const GetPhotographers(this._hallsRepository);

  Future<List<Photographer>> call() => _hallsRepository.getPhotographers();
}
