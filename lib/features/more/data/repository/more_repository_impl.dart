import 'package:event_creator/features/more/data/models/contact_us_data_model.dart';
import 'package:event_creator/features/more/domain/entities/contact_us_data.dart';
import 'package:event_creator/features/more/domain/repository/more_repository.dart';
import 'package:event_creator/features/more/domain/services/more_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MoreRepository)
class MoreRepositoryImpl implements MoreRepository {
  final MoreService _moreService;

  const MoreRepositoryImpl(this._moreService);

  @override
  Future<void> contactUs(ContactUsData contactUsData) async =>
      _moreService.contactUs(contactUsData.fromEntity);
}

extension ContactUsDataModelMapper on ContactUsData {
  ContactUsDataModel get fromEntity => ContactUsDataModel(
        name: name,
        emailAddress: emailAddress.value,
        subject: subject,
        message: message,
      );
}
