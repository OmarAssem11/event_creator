import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:event_creator/utils/cache/cache_service.dart';
import 'package:event_creator/utils/constants.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:injectable/injectable.dart';

@singleton
class TokenInterceptor extends Interceptor {
  final CacheService _cacheService;
  final ConnectivityManager _connectivityManager;

  const TokenInterceptor(
    this._cacheService,
    this._connectivityManager,
  );

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isConnected = await _connectivityManager.isConnected();
    if (!isConnected) {
      final cancelToken = CancelToken();
      options.cancelToken = cancelToken;
      cancelToken.cancel();
    } else {
      String? token;
      try {
        token = await _cacheService.get(CacheConstants.authTokenKey) as String?;
      } on CacheException {
        return handler.next(options);
      }
      if (token != null) {
        options.headers.addAll({
          'Authorization': 'Bearer $token',
        });
      }
    }
    return handler.next(options);
  }
}

@lazySingleton
class ConnectivityManager {
  final Connectivity _connectivity;

  const ConnectivityManager(this._connectivity);

  Future<bool> isConnected() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
