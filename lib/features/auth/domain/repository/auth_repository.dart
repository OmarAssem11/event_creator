import 'package:event_creator/features/auth/domain/entities/login_data.dart';
import 'package:event_creator/features/auth/domain/entities/register_data.dart';

abstract class AuthRepository {
  Future<void> registerWithEmailAndPassword(RegisterData registerData);

  Future<void> loginWithEmailAndPassword(LoginData loginData);

  Future<void> logout();

  Future<bool> getAuthStatus();
}
