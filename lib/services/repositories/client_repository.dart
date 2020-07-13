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
      final responce = await HanotiApi.dio.get('/users');
      List _temp = responce.data;
      List<Client> _clients =
          _temp.map((client) => Client.fromJson(client)).toList();
      return _clients;
    } on DioError catch (e) {
      throw showNetworkError(e);
    }
  }
}
