import 'package:dio/dio.dart';
import 'package:hanoti/services/classes/client/client.dart';
import 'package:hanoti/services/classes/errors/errors.dart';
import 'package:hanoti/services/hanoti_api.dart';

abstract class ClientRepository {
  // fetch clients from API
  Future<List<Client>> getAllClients();
}

class ClientRepositoryImpl implements ClientRepository {
  @override
  Future<List<Client>> getAllClients() async {
    try {
      final cacheManager = HanotiApi.dioCacheManager;
      final cacheOptions = HanotiApi.cacheOptions;
      HanotiApi.dio.interceptors.add(cacheManager.interceptor);
      final response = await HanotiApi.dio.get('/users', options: cacheOptions);

      List<Client> _clients = ((response.data) as List)
          .map((provider) => Client.fromJson(provider))
          .toList();
      return _clients;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
