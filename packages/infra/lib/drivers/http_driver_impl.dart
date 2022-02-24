import 'package:core/resources/types.dart';
import 'package:dio/dio.dart';

import 'http_driver.dart';

class HttpMethod {
  static final String GET = 'GET';
  static final String POST = 'POST';
}

class HttpDriverImpl implements HttpDriver {
  @override
  Future<T> request<T>({
    required String baseUrl,
    required String method,
    required Mapper<T> mapper,
    String endpoint = '',
    dynamic data,
    JsonObject? queryParams,
  }) async {
    try {
      final response = await Dio(BaseOptions(baseUrl: baseUrl)).request(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: Options(method: method),
      );
      return mapper(response.data);
    } on Exception catch (_) {
      rethrow;
    }
  }
}
