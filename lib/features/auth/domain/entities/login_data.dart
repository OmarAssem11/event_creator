import 'package:event_creator/features/auth/domain/entities/email_address.dart';
import 'package:event_creator/features/auth/domain/entities/password.dart';

class LoginData {
  final EmailAddress emailAddress;
  final Password password;

  const LoginData({
    required this.emailAddress,
    required this.password,
  });
}
