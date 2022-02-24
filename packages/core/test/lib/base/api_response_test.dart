import 'package:core/base/api_response.dart';
import 'package:flutter_test/flutter_test.dart';

late ApiResponse apiResponse;

void main() {
  test('should get response success', () async {
    final response = ApiResponse.success('test');

    expect(response.data, 'test');
    expect(response.isSuccess, true);
  });

  test('should get response false', () async {
    final exception = Exception();
    final response = ApiResponse.error(exception);

    expect(response.error, exception);
    expect(response.isSuccess, false);
  });
}
