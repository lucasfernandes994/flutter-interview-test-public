import 'package:flutter_interview_test/core/base/api_response.dart';
import 'package:flutter_interview_test/core/resources/endpoints.dart';
import 'package:flutter_interview_test/domain/entities/character.dart';
import 'package:flutter_interview_test/domain/entities/paged_result.dart';
import 'package:flutter_interview_test/domain/repositories/character_repository.dart';
import 'package:flutter_interview_test/infra/drivers/http_driver.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  const CharacterRepositoryImpl();

  @override
  Future<ApiResponse<PagedResult<Character>>> getAll(int page) =>
      HttpDriver(Endpoints.baseUrl).request<PagedResult<Character>>(
        method: HttpMethod.GET,
        endpoint: Endpoints.character,
        queryParams: {'page': page},
        mapper: (dynamic json) =>
            PagedResult.fromJson<Character>(json, Character.fromJson),
      );
}
