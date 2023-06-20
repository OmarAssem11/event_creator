import 'package:event_creator/features/auth/data/models/login_data_model.dart';
import 'package:event_creator/features/auth/data/models/register_data_model.dart';
import 'package:event_creator/features/auth/domain/entities/login_data.dart';
import 'package:event_creator/features/auth/domain/entities/register_data.dart';
import 'package:event_creator/features/auth/domain/repository/auth_repository.dart';
import 'package:event_creator/features/auth/domain/services/auth_service.dart';
import 'package:event_creator/utils/cache/cache_service.dart';
import 'package:event_creator/utils/constants.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final CacheService _cacheService;

  const AuthRepositoryImpl(this._authService, this._cacheService);

  @override
  Future<void> registerWithEmailAndPassword(RegisterData registerData) async {
    final token = await _authService
        .registerWithEmailAndPassword(registerData.fromEntity);
    return _cacheService.put(
      CacheConstants.authTokenKey,
      token.value,
    );
  }

  @override
  Future<void> loginWithEmailAndPassword(LoginData loginData) async {
    final token =
        await _authService.loginWithEmailAndPassword(loginData.fromEntity);
    return _cacheService.put(
      CacheConstants.authTokenKey,
      token.value,
    );
  }

  @override
  Future<void> logout() async {
    return _cacheService.delete(CacheConstants.authTokenKey);
  }

  @override
  Future<bool> getAuthStatus() async {
    return (await _cacheService.get(CacheConstants.authTokenKey)) is String;
  }
}

extension RegisterDataModelMapper on RegisterData {
  RegisterDataModel get fromEntity => RegisterDataModel(
        name: name,
        emailAddress: emailAddress.value,
        password: password.value,
        phoneNumber: phoneNumber.value,
        gender: gender.text,
      );
}

extension LoginDataModelMapper on LoginData {
  LoginDataModel get fromEntity => LoginDataModel(
        emailAddress: emailAddress.value,
        password: password.value,
      );
}
