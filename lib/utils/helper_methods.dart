import 'package:event_creator/features/auth/domain/entities/email_address.dart';
import 'package:event_creator/features/auth/domain/entities/password.dart';
import 'package:event_creator/features/auth/domain/entities/phone_number.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:intl/intl.dart';

String? validateRegularText(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return '$fieldName ${S.current.canNotBeEmpty}';
  }
  return null;
}

String? validateEmailAddress(String? value) {
  try {
    if (value == null || value.isEmpty) {
      return S.current.emailCanNotBeEmpty;
    }
    EmailAddress(value);
  } on InvalidEmailAddressException catch (exception) {
    return exception.message;
  }
  return null;
}

String? validatePassword(String? value) {
  try {
    if (value == null || value.isEmpty) {
      return S.current.passwordCanNotBeEmpty;
    }
    Password(value);
  } on InvalidPasswordException catch (exception) {
    return exception.message;
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  try {
    if (value == null || value.isEmpty) {
      return S.current.phoneNumberCanNotBeEmpty;
    }
    PhoneNumber(countryCode: '+20', number: value);
  } on InvalidPhoneNumberException catch (exception) {
    return exception.message;
  }
  return null;
}

String formatDateTime(DateTime dateTime) =>
    DateFormat('yyyy-mm-dd').format(dateTime);
