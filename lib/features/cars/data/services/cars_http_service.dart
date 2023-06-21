import 'package:dio/dio.dart';
import 'package:event_creator/features/cars/data/models/car_booking_data_model.dart';
import 'package:event_creator/features/cars/data/models/car_model.dart';
import 'package:event_creator/features/cars/data/models/car_rating_data_model.dart';
import 'package:event_creator/features/cars/domain/services/cars_service.dart';
import 'package:event_creator/utils/constants.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:event_creator/utils/exception/create_remote_exception.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CarsService)
class CarsHTTPService implements CarsService {
  final Dio _dio;

  const CarsHTTPService(this._dio);

  @override
  Future<List<CarModel>> getAllCars() async {
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
  Future<void> rateCar(CarRatingDataModel carRatingDataModel) async {
    try {
      final formData = FormData.fromMap(carRatingDataModel.toJson());
      final response = await _dio.post(
        HostConstants.rateCarEndpoint,
        data: formData,
      );
      final responseJson = response.data as Map<String, dynamic>;
      if (responseJson['sucess'] != 'Success') {
        throw UnknownAuthRemoteException();
      }
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }

  @override
  Future<void> bookCar(CarBookingDataModel carBookingDataModel) async {
    try {
      final formData = FormData.fromMap(carBookingDataModel.toJson());
      final response = await _dio.post(
        HostConstants.carBookingEndpoint,
        data: formData,
      );
      final responseJson = response.data as Map<String, dynamic>;
      if (responseJson['sucess'] != 'Success') {
        throw UnknownAuthRemoteException();
      }
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }
}
