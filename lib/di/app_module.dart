import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:event_creator/utils/constants.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio();
    dio.options = BaseOptions(
      baseUrl: HostConstants.baseUrl,
      receiveDataWhenStatusError: true,
    );
    return dio;
  }

  @lazySingleton
  Connectivity get connectivity => Connectivity();
}
