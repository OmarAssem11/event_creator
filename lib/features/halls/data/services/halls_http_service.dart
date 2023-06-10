import 'package:dio/dio.dart';
import 'package:event_creator/features/halls/data/models/hall_model.dart';
import 'package:event_creator/features/halls/domain/services/halls_service.dart';
import 'package:event_creator/utils/constants.dart';
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
}
