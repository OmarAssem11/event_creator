import 'package:event_creator/features/more/data/models/contact_us_data_model.dart';

abstract class MoreService {
  Future<void> contactUs(ContactUsDataModel contactUsDataModel);
}
