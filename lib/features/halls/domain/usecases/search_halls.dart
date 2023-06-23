import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/domain/entities/halls_search_data.dart';
import 'package:event_creator/features/halls/domain/repository/halls_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchHalls {
  final HallsRepository _hallsRepository;

  const SearchHalls(this._hallsRepository);

  Future<List<Hall>> call(HallsSearchData hallsSearchData) =>
      _hallsRepository.searchHalls(hallsSearchData);
}
