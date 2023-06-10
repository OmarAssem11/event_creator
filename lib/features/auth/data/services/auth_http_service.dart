import 'package:dio/dio.dart';
import 'package:event_creator/features/auth/domain/entities/login_data.dart';
import 'package:event_creator/features/auth/domain/entities/register_data.dart';
import 'package:event_creator/features/auth/domain/services/auth_service.dart';
import 'package:event_creator/utils/constants.dart';
import 'package:event_creator/utils/exception/create_remote_exception.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthService)
class AuthHTTPService implements AuthService {
  final Dio _dio;

  const AuthHTTPService(this._dio);

  @override
  Future<Token> registerWithEmailAndPassword(RegisterData registerData) async {
    try {
      final response = await _dio.post(
        HostConstants.registerEndpoint,
        data: {
          'email': registerData.emailAddress,
          'password': registerData.password,
        },
      );
      return const Token('token');
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }

  @override
  Future<Token> loginWithEmailAndPassword(LoginData loginData) async {
    try {
      final response = await _dio.post(
        HostConstants.loginEndpoint,
        data: {
          'email': loginData.emailAddress,
          'password': loginData.password,
        },
      );
      return const Token('token');
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }
}
