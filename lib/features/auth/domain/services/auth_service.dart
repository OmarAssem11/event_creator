import 'package:event_creator/features/auth/data/models/login_data_model.dart';
import 'package:event_creator/features/auth/data/models/register_data_model.dart';

abstract class AuthService {
  Future<Token> registerWithEmailAndPassword(
    RegisterDataModel registerDataModel,
  );

  Future<Token> loginWithEmailAndPassword(LoginDataModel loginDataModel);
}

class Token {
  final String value;

  const Token(this.value);
}
