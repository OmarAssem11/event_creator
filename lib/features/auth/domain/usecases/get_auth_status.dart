import 'package:event_creator/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAuthStatus {
  final AuthRepository _authRepository;

  const GetAuthStatus(this._authRepository);

  Future<bool> call() => _authRepository.getAuthStatus();
}
