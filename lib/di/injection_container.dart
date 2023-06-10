import 'package:dio/dio.dart';
import 'package:event_creator/di/injection_container.config.dart';
import 'package:event_creator/features/auth/data/services/token_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
  getIt<Dio>().interceptors.add(getIt<TokenInterceptor>());
}
