import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/features/cars/domain/entities/cars_search_data.dart';
import 'package:event_creator/features/cars/domain/repository/cars_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SearchCars {
  final CarsRepository _carsRepository;

  const SearchCars(this._carsRepository);

  Future<List<Car>> call(CarsSearchData carsSearchData) =>
      _carsRepository.searchCars(carsSearchData);
}
