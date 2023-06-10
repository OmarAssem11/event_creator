import 'package:event_creator/features/auth/domain/entities/login_data.dart';
import 'package:event_creator/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginWithEmailAndPassword {
  final AuthRepository _authRepository;

  const LoginWithEmailAndPassword(this._authRepository);

  Future<void> call(LoginData loginData) =>
      _authRepository.loginWithEmailAndPassword(loginData);
}
