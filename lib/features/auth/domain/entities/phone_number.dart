import 'package:equatable/equatable.dart';
import 'package:event_creator/utils/exception/app_exception.dart';

class PhoneNumber extends Equatable {
  late final String _countryCode;
  late final StringBuffer _number;

  PhoneNumber({
    required String countryCode,
    required String number,
  }) {
    _countryCode = countryCode;
    _number = StringBuffer(number);
    _validate();
  }

  void _validate() {
    final numberString = _number.toString();
    final phoneNumberPattern = RegExp(
      r"^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$",
    );
    if (!phoneNumberPattern.hasMatch(numberString)) {
      throw InvalidPhoneNumberException();
    } else if (_countryCode == '+20' && numberString.startsWith('0')) {
      final updatedNumber =
          numberString.replaceFirst(RegExp('0'), '').trimLeft();
      _number.clear();
      _number.write(updatedNumber);
    }
  }

  String get value => '$_countryCode$_number';

  @override
  List<Object?> get props => [_countryCode, _number.toString()];
}
