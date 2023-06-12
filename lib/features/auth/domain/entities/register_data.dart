import 'package:event_creator/features/auth/domain/entities/email_address.dart';
import 'package:event_creator/features/auth/domain/entities/gender.dart';
import 'package:event_creator/features/auth/domain/entities/password.dart';
import 'package:event_creator/features/auth/domain/entities/phone_number.dart';

class RegisterData {
  final String name;
  final EmailAddress emailAddress;
  final Password password;
  final PhoneNumber phoneNumber;
  final Gender gender;

  const RegisterData({
    required this.name,
    required this.emailAddress,
    required this.password,
    required this.phoneNumber,
    required this.gender,
  });
}
