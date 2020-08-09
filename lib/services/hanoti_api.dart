import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HanotiApi {
  static DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
  static Options cacheOptions =
      buildCacheOptions(Duration(days: 1), forceRefresh: true);
  static BaseOptions _baseOptions =
      BaseOptions(baseUrl: DotEnv().env['BASE_URL']);
  static Dio dio = Dio(_baseOptions);
}
