import 'package:event_creator/features/auth/domain/entities/login_data.dart';
import 'package:event_creator/features/auth/domain/entities/register_data.dart';

abstract class AuthService {
  Future<Token> registerWithEmailAndPassword(RegisterData registerData);

  Future<Token> loginWithEmailAndPassword(LoginData loginData);
}

class Token {
  final String value;

  const Token(this.value);
}
