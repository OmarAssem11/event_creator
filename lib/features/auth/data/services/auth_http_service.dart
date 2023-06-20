import 'package:dio/dio.dart';
import 'package:event_creator/features/auth/data/models/login_data_model.dart';
import 'package:event_creator/features/auth/data/models/register_data_model.dart';
import 'package:event_creator/features/auth/domain/services/auth_service.dart';
import 'package:event_creator/utils/constants.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:event_creator/utils/exception/create_remote_exception.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthService)
class AuthHTTPService implements AuthService {
  final Dio _dio;

  const AuthHTTPService(this._dio);

  @override
  Future<Token> registerWithEmailAndPassword(
    RegisterDataModel registerDataModel,
  ) async {
    try {
      final formData = FormData.fromMap(registerDataModel.toJson());
      final response = await _dio.post(
        HostConstants.registerEndpoint,
        data: formData,
      );
      final responseJson = response.data as Map<String, dynamic>;
      if (responseJson['sucess'] == 'Success') {
        return const Token('token');
      } else {
        throw UnknownAuthRemoteException();
      }
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }

  @override
  Future<Token> loginWithEmailAndPassword(LoginDataModel loginDataModel) async {
    try {
      final formData = FormData.fromMap(loginDataModel.toJson());
      final response = await _dio.post(
        HostConstants.loginEndpoint,
        data: formData,
      );
      final responseJson = response.data as Map<String, dynamic>;
      if (responseJson['sucess'] == 'Success') {
        return const Token('token');
      } else {
        throw UnknownAuthRemoteException();
      }
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }
}
