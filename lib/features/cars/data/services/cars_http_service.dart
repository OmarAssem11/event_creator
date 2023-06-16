import 'package:dio/dio.dart';
import 'package:event_creator/features/cars/data/models/car_model.dart';
import 'package:event_creator/features/cars/domain/entities/car_booking_data.dart';
import 'package:event_creator/features/cars/domain/services/cars_service.dart';
import 'package:event_creator/utils/constants.dart';
import 'package:event_creator/utils/exception/create_remote_exception.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CarsService)
class CarsHTTPService implements CarsService {
  final Dio _dio;

  const CarsHTTPService(this._dio);

  @override
  Future<List<CarModel>> getAllHalls() async {
    try {
      final response = await _dio.get(HostConstants.getAllCarsEndpoint);
      final responseBody = response.data as List;
      final carsModels = responseBody
          .map((json) => CarModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return carsModels;
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }

  @override
  Future<void> rateCar({
    required String carId,
    required double rating,
  }) async {
    try {
      return await Future.delayed(const Duration(milliseconds: 700));
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }

  @override
  Future<void> bookCar(CarBookingData bookingData) async {
    try {
      return await Future.delayed(const Duration(milliseconds: 700));
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }
}
