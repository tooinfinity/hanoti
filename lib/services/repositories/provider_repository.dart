import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hanoti/services/classes/errors/errors.dart';
import 'package:hanoti/services/classes/provider/provider.dart';
import 'package:hanoti/services/hanoti_api.dart';
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
        final response = await HanotiApi.dio.get('/posts');
        String _temp = json.encode(response.data);
        List<Provider> _providers = (response.data as List)
            .map((provider) => Provider.fromJson(provider))
            .toList();

        var tempDir = await getTemporaryDirectory();
        File file = new File(tempDir.path + "/" + fileName);
        file.writeAsString(_temp, flush: true, mode: FileMode.write);
        return _providers;
      } on DioError catch (e) {
        throw showNetworkError(e);
      }
    }
  }
}
