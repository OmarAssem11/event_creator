import 'package:event_creator/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class Logout {
  final AuthRepository _authRepository;

  const Logout(this._authRepository);

  Future<void> call() => _authRepository.logout();
}
