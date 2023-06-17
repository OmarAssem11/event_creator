import 'package:event_creator/features/auth/domain/entities/email_address.dart';

class ContactUsData {
  final String name;
  final EmailAddress emailAddress;
  final String subject;
  final String message;

  const ContactUsData({
    required this.name,
    required this.emailAddress,
    required this.subject,
    required this.message,
  });
}
