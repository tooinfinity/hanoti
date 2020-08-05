import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hanoti/services/classes/errors/errors.dart';
import 'package:hanoti/services/classes/provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

abstract class ProviderRepository {
  // fetch Providers from API
  Future<List<Provider>> getAllProviders();
}

class ProviderRepositoryImpl implements ProviderRepository {
  @override
  Future<List<Provider>> getAllProviders() async {
    String fileName = "CacheData.json";
    var cacheDir = await getTemporaryDirectory();

    if (await File(cacheDir.path + "/" + fileName).exists()) {
      print("Loading from cache");
      //TOD0: Reading from the json File
      var jsonData = File(cacheDir.path + "/" + fileName).readAsStringSync();
      List<Provider> _providers = (json.decode(jsonData) as List)
          .map((provider) => Provider.fromJson(provider))
          .toList();
      return _providers;
    } else {
      try {
        final response =
            await http.get('https://jsonplaceholder.typicode.com/posts');
        List<Provider> _providers = (json.decode(response.body) as List)
            .map((provider) => Provider.fromJson(provider))
            .toList();

        var tempDir = await getTemporaryDirectory();
        File file = new File(tempDir.path + "/" + fileName);
        file.writeAsString(response.body, flush: true, mode: FileMode.write);
        return _providers;
      } on DioError catch (e) {
        throw showNetworkError(e);
      }
    }
  }
}
