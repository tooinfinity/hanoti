import 'package:dio/dio.dart';
import 'package:hanoti/services/classes/errors/errors.dart';
import 'package:hanoti/services/classes/provider/provider.dart';
import 'package:hanoti/services/hanoti_api.dart';

abstract class ProviderRepository {
  // fetch Providers from API
  Future<List<Provider>> getAllProviders();
}

class ProviderRepositoryImpl implements ProviderRepository {
  @override
  Future<List<Provider>> getAllProviders() async {
    try {
      final cacheManager = HanotiApi.dioCacheManager;
      final cacheOptions = HanotiApi.cacheOptions;
      HanotiApi.dio.interceptors.add(cacheManager.interceptor);
      final response = await HanotiApi.dio.get('/posts', options: cacheOptions);

      List<Provider> _providers = (response.data as List)
          .map((provider) => Provider.fromJson(provider))
          .toList();
      return _providers;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
