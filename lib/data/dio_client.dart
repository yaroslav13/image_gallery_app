import 'package:dio/dio.dart';
import 'package:imagegallerytest/resources/app_api.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();

  final Dio _dio;

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal() : _dio = Dio() {
    _dio.options.baseUrl = AppApi.base;
    _dio.options.connectTimeout = 60000;
    _dio.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
    _dio.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
  }

  Future<dynamic> get(String path, {String baseUrl}) =>
      _makeRequest(_HttpMethod.GET, path);


  Future _makeRequest(String method, String path) async {
    final response = await _dio.request(path,
        options: RequestOptions(
            method: method,
            baseUrl: AppApi.base));
    return response.data;
  }
}

class _HttpMethod {
  static const String GET = 'GET';
}
