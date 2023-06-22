import 'package:dio/dio.dart';
import 'package:event_creator/utils/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
