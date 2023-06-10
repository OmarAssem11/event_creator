import 'package:event_creator/utils/cache/cache_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CacheService)
class SharedPrefCacheService implements CacheService {
  @override
  Future<void> delete(String key) async {}

  @override
  Future<dynamic> get(String key) async {}

  @override
  Future<void> put(String key, dynamic value) async {}
}
