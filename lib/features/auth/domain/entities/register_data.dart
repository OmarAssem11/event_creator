import 'package:event_creator/features/auth/domain/entities/email_address.dart';
import 'package:event_creator/features/auth/domain/entities/password.dart';

class RegisterData {
  final EmailAddress emailAddress;
  final Password password;

  const RegisterData({
    required this.emailAddress,
    required this.password,
  });
}
