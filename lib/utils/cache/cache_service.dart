abstract class CacheService {
  Future<void> put(String key, dynamic value);

  Future<dynamic> get(String key);

  Future<void> delete(String key);
}
