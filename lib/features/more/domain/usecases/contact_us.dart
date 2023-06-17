import 'package:event_creator/features/more/domain/entities/contact_us_data.dart';
import 'package:event_creator/features/more/domain/repository/more_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ContactUs {
  final MoreRepository _moreRepository;

  const ContactUs(this._moreRepository);

  Future<void> call(ContactUsData contactUsData) =>
      _moreRepository.contactUs(contactUsData);
}
