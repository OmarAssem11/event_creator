import 'dart:io';

import 'package:event_creator/utils/exception/app_exception.dart';

RemoteException createRemoteException(Object exception) {
  if (exception is SocketException) {
    return NoInternetConnectionException();
  } else {
    return UnknownRemoteException();
  }
}
