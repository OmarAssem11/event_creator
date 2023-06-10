import 'package:event_creator/features/auth/domain/entities/register_data.dart';
import 'package:event_creator/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RegisterWithEmailAndPassword {
  final AuthRepository _authRepository;

  const RegisterWithEmailAndPassword(this._authRepository);

  Future<void> call(RegisterData registerData) =>
      _authRepository.registerWithEmailAndPassword(registerData);
}
