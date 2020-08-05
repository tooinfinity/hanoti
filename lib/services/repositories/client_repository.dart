import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hanoti/services/classes/client/client.dart';
import 'package:hanoti/services/classes/errors/errors.dart';
import 'package:hanoti/services/hanoti_api.dart';
import 'package:path_provider/path_provider.dart';

abstract class ClientRepository {
  // fetch clients from API
  Future<List<Client>> getAllClients();
}

class ClientRepositoryImpl implements ClientRepository {
  @override
  Future<List<Client>> getAllClients() async {
    String fileName = "CachedClient.json";
    var cacheDir = await getTemporaryDirectory();

    if (await File(cacheDir.path + "/" + fileName).exists()) {
      print("Loading from cache");
      //TOD0: Reading from the json File
      var jsonData = File(cacheDir.path + "/" + fileName).readAsStringSync();
      List<Client> _clients = (json.decode(jsonData) as List)
          .map((client) => Client.fromJson(client))
          .toList();
      return _clients;
    } else {
      try {
        final response = await HanotiApi.dio.get('/users');
        String _temp = json.encode(response.data);

        List<Client> _clients = ((response.data) as List)
            .map((provider) => Client.fromJson(provider))
            .toList();

        var tempDir = await getTemporaryDirectory();
        File file = new File(tempDir.path + "/" + fileName);
        file.writeAsString(_temp, flush: true, mode: FileMode.write);
        return _clients;
      } on DioError catch (e) {
        throw showNetworkError(e);
      }
    }
  }
}
