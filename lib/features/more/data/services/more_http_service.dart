import 'package:event_creator/features/more/data/models/contact_us_data_model.dart';
import 'package:event_creator/features/more/domain/services/more_service.dart';
import 'package:event_creator/utils/exception/create_remote_exception.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MoreService)
class MoreHTTPService implements MoreService {
  const MoreHTTPService();

  @override
  Future<void> contactUs(ContactUsDataModel contactUsDataModel) async {
    try {
      return await Future.delayed(const Duration(milliseconds: 700));
    } catch (exception) {
      throw createRemoteException(exception);
    }
  }
}
