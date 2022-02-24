import 'package:core/base/api_response.dart';
import 'package:core/resources/types.dart';

abstract class HttpDriver {
  Future<T> request<T>({
    required String baseUrl,
    required String method,
    required Mapper<T> mapper,
    String endpoint = '',
    dynamic data,
    JsonObject? queryParams,
  });
}
