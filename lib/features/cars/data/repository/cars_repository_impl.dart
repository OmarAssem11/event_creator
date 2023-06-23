import 'package:event_creator/features/cars/data/models/car_booking_data_model.dart';
import 'package:event_creator/features/cars/data/models/car_model.dart';
import 'package:event_creator/features/cars/data/models/car_rating_data_model.dart';
import 'package:event_creator/features/cars/data/models/cars_search_data_model.dart';
import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/features/cars/domain/entities/car_booking_data.dart';
import 'package:event_creator/features/cars/domain/entities/car_brand.dart';
import 'package:event_creator/features/cars/domain/entities/car_rating_data.dart';
import 'package:event_creator/features/cars/domain/entities/cars_search_data.dart';
import 'package:event_creator/features/cars/domain/repository/cars_repository.dart';
import 'package:event_creator/features/cars/domain/services/cars_service.dart';
import 'package:event_creator/utils/helper_methods.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CarsRepository)
class CarsRepositoryImpl implements CarsRepository {
  final CarsService _carsService;

  const CarsRepositoryImpl(this._carsService);

  @override
  Future<List<Car>> getAllCars() async {
    final carsModels = await _carsService.getAllCars();
    return carsModels.map((carModel) => carModel.toEntity).toList();
  }

  @override
  Future<List<Car>> searchCars(CarsSearchData carsSearchData) async {
    final carsModels = await _carsService.searchCars(carsSearchData.fromEntity);
    return carsModels.map((carModel) => carModel.toEntity).toList();
  }

  @override
  Future<void> rateCar(CarRatingData carRatingData) async =>
      _carsService.rateCar(carRatingData.fromEntity);

  @override
  Future<void> bookCar(CarBookingData carBookingData) async =>
      _carsService.bookCar(carBookingData.fromEntity);
}

extension CarMapper on CarModel {
  Car get toEntity => Car(
        id: id,
        description: description,
        imageUrl: imageUrl,
        price: price,
        rating: rating,
        numOfRatings: numOfRatings,
        brand: CarBrand.fromText(brand),
        model: model,
      );
}

extension CarsSearchDataModelMapper on CarsSearchData {
  CarsSearchDataModel get fromEntity => CarsSearchDataModel(
        startDate: formatDateTime(startDate),
        endDate: formatDateTime(endDate),
        brand: brand.text,
        option: option.text,
      );
}

extension CarRatingDataModelMapper on CarRatingData {
  CarRatingDataModel get fromEntity => CarRatingDataModel(
        carId: carId,
        rating: rating,
        numOfRatings: numOfRatings,
      );
}

extension CarBookingDataModelMapper on CarBookingData {
  CarBookingDataModel get fromEntity => CarBookingDataModel(
        carId: carId,
        startDate: formatDateTime(startDate),
        endDate: formatDateTime(endDate),
      );
}
