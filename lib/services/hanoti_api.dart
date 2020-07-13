import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HanotiApi {
  static BaseOptions _baseOptions =
      BaseOptions(baseUrl: DotEnv().env['BASE_URL']);
  static Dio dio = Dio(_baseOptions);
}
