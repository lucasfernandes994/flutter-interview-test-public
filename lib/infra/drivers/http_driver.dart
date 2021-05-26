import 'package:dio/dio.dart';
import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/core/resources/types.dart';

class HttpMethod {
  static final String GET = 'GET';
  static final String POST = 'POST';
}

class HttpDriver {
  final String baseUrl;

  HttpDriver(this.baseUrl);

  Dio get _dio => Dio(BaseOptions(baseUrl: baseUrl));

  Future<ApiResponse<T>> request<T>({
    required String method,
    required Mapper<T> mapper,
    String endpoint = '',
    dynamic data,
    JsonObject? queryParams,
  }) async {
    try {
      final response = await _dio.request(
        endpoint,
        data: data,
        queryParameters: queryParams,
        options: Options(method: method),
      );
      return ApiResponse<T>.success(mapper(response.data));
    } on Exception catch (e) {
      return ApiResponse<T>.error(e);
    } catch (_) {
      return ApiResponse<T>.error(null);
    }
  }
}
