abstract class CacheService {
  Future<void> putString(String key, String value);

  Future<String> getString(String key);

  Future<void> delete(String key);
}
