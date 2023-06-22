import 'package:event_creator/utils/cache/cache_service.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: CacheService)
class SharedPrefCacheService implements CacheService {
  final SharedPreferences _sharedPreferences;

  const SharedPrefCacheService(this._sharedPreferences);
  @override
  Future<void> putString(String key, String value) async {
    try {
      await _sharedPreferences.setString(key, value);
    } catch (exception) {
      throw CacheException();
    }
  }

  @override
  Future<String> getString(String key) async {
    try {
      return _sharedPreferences.get(key)! as String;
    } catch (exception) {
      throw CacheException();
    }
  }

  @override
  Future<void> delete(String key) async {
    try {
      await _sharedPreferences.remove(key);
    } catch (exception) {
      throw CacheException();
    }
  }
}
