import 'package:core/base/api_response.dart';
import 'package:domain/entities/character.dart';
import 'package:domain/entities/paged_result.dart';

abstract class CharacterRepository {
  Future<ApiResponse<PagedResult<Character>>> getAll(int page);
}
