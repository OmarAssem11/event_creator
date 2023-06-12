import 'package:event_creator/generated/l10n.dart';

abstract class AppException implements Exception {
  late final String message;

  AppException([String? msg]) : message = msg ?? S.current.somethingWentWrong;
}

abstract class RemoteException extends AppException {
  RemoteException([super.msg]);
}

abstract class LocalException extends AppException {}

abstract class AuthRemoteException extends RemoteException {
  AuthRemoteException([super.msg]);
}

abstract class ValidationException extends AppException {
  ValidationException([super.msg]);
}

class BadRequestException extends RemoteException {}

class UnauthorizedException extends RemoteException {}

class ForbiddenException extends RemoteException {}

class NotFoundException extends RemoteException {}

class RequestTimeoutException extends RemoteException {}

class ServiceUnavailableException extends RemoteException {}

class InternalServerErrorException extends RemoteException {}

class NoInternetConnectionException extends RemoteException {
  NoInternetConnectionException() : super(S.current.noInternetConnection);
}

class UnknownRemoteException extends RemoteException {}

class CacheException extends LocalException {}

class EmailAlreadyInUseException extends AuthRemoteException {
  EmailAlreadyInUseException() : super(S.current.emailAlreadyInUse);
}

class WrongPasswordException extends AuthRemoteException {
  WrongPasswordException() : super(S.current.incorrectPassword);
}

class UserNotFoundException extends AuthRemoteException {
  UserNotFoundException() : super(S.current.incorrectEmailAddress);
}

class UnknownAuthRemoteException extends AuthRemoteException {}

class InvalidEmailAddressException extends ValidationException {
  InvalidEmailAddressException() : super(S.current.invalidEmailAddress);
}

class InvalidPasswordException extends ValidationException {
  InvalidPasswordException() : super(S.current.passwordMustBeAtLeast8Chars);
}

class InvalidPhoneNumberException extends ValidationException {
  InvalidPhoneNumberException() : super(S.current.invalidPhoneNumber);
}
