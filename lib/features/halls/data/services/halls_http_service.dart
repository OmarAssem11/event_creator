import 'package:dio/dio.dart';
import 'package:event_creator/features/halls/data/models/hairdresser_model.dart';
import 'package:event_creator/features/halls/data/models/hall_booking_data_model.dart';
import 'package:event_creator/features/halls/data/models/hall_model.dart';
import 'package:event_creator/features/halls/data/models/hall_rating_data_model.dart';
import 'package:event_creator/features/halls/data/models/halls_search_data_model.dart';
import 'package:event_creator/features/halls/data/models/photographer_model.dart';
import 'package:event_creator/features/halls/domain/services/halls_service.dart';
import 'package:event_creator/utils/constants.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:event_creator/utils/exception/create_remote_exception.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HallsService)
class HallsHTTPService implements HallsService {
  final Dio _dio;

  const HallsHTTPService(this._dio);

  @override
  Future<List<HallModel>> getAllHalls() async {
    try {
      final response = await _dio.get(HostConstants.getAllHallsEndpoint);
      final responseBody = response.data as List;
      final hallsModels = responseBody
          .map((json) => HallModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return hallsModels;
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }

  @override
  Future<List<HallModel>> getOffersHalls() async {
    try {
      final response = await _dio.get(HostConstants.getOffersHallsEndpoint);
      final responseBody = response.data as List;
      final hallsModels = responseBody
          .map((json) => HallModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return hallsModels;
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }

  @override
  Future<List<HallModel>> searchHalls(
    HallsSearchDataModel hallsSearchDataModel,
  ) async {
    try {
      final response = await _dio.get(
        HostConstants.searchHallsEndpoint,
        queryParameters: hallsSearchDataModel.toJson(),
      );
      final responseBody = response.data as List;
      final hallsModels = responseBody
          .map((json) => HallModel.fromJson(json as Map<String, dynamic>))
          .toList();
      return hallsModels;
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }

  @override
  Future<List<HairdresserModel>> getHairdressers() async {
    try {
      final response = await _dio.get(HostConstants.getHairdressersEndpoint);
      final responseBody = response.data as List;
      final hairdressersModels = responseBody
          .map(
            (json) => HairdresserModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
      return hairdressersModels;
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }

  @override
  Future<List<PhotographerModel>> getPhotographers() async {
    try {
      final response = await _dio.get(HostConstants.getPhotographersEndpoint);
      final responseBody = response.data as List;
      final photographersModels = responseBody
          .map(
            (json) => PhotographerModel.fromJson(json as Map<String, dynamic>),
          )
          .toList();
      return photographersModels;
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }

  @override
  Future<void> rateHall(HallRatingDataModel hallRatingDataModel) async {
    try {
      final formData = FormData.fromMap(hallRatingDataModel.toJson());
      final response = await _dio.post(
        HostConstants.rateHallEndpoint,
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
  Future<void> bookHall(HallBookingDataModel hallBookingDataModel) async {
    try {
      final formData = FormData.fromMap(hallBookingDataModel.toJson());
      final response = await _dio.post(
        HostConstants.hallBookingEndpoint,
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
