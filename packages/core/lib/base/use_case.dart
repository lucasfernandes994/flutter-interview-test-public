import 'api_response.dart';

abstract class UseCase<Output, Input> {
  Future<ApiResponse<Output>?> call(Input param);
}

class NoParams {
  List<Object?> get props => [];
}
