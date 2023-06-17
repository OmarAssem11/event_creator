import 'package:event_creator/features/more/domain/entities/contact_us_data.dart';

abstract class MoreRepository {
  Future<void> contactUs(ContactUsData contactUsData);
}
