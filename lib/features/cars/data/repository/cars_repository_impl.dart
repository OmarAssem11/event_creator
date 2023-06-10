import 'package:event_creator/features/cars/data/models/car_model.dart';
import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/features/cars/domain/repository/cars_repository.dart';
import 'package:event_creator/features/cars/domain/services/cars_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CarsRepository)
class CarsRepositoryImpl implements CarsRepository {
  final CarsService _carsService;

  const CarsRepositoryImpl(this._carsService);

  @override
  Future<List<Car>> getAllCars() async {
    final carsModels = await _carsService.getAllHalls();
    return carsModels.map((carModel) => carModel.toEntity).toList();
  }
}

extension CarMapper on CarModel {
  Car get toEntity => Car(
        id: id,
        description: description,
        imageUrl: imageUrl,
        brand: brand,
        model: model,
        price: price,
      );
}
