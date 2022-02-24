import 'package:core/base/api_response.dart';
import 'package:core/resources/endpoints.dart';
import 'package:data/models/character_model.dart';
import 'package:data/models/page_result_model.dart';
import 'package:domain/entities/character.dart';
import 'package:domain/entities/paged_result.dart';
import 'package:domain/repositories/character_repository.dart';
import 'package:infra/drivers/http_driver.dart';
import 'package:infra/drivers/http_driver_impl.dart';

import 'character_mapper.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final HttpDriver _httpDriver;
  final CharacterMapper _mapper;

  const CharacterRepositoryImpl(this._httpDriver, this._mapper);

  @override
  Future<ApiResponse<PagedResult<Character>>> getAll(int page) async {
    try {
      final response = await _httpDriver.request<PagedResultModel<CharacterModel>>(
        baseUrl: Endpoints.baseUrl,
        method: HttpMethod.GET,
        endpoint: Endpoints.character,
        queryParams: {'page': page},
        mapper: (dynamic json) => PagedResultModel.fromJson<CharacterModel>(json, CharacterModel.fromJson),
      );
      return _mapper.mapPagedResultModel(response);
    } on Exception catch (e) {
      return _mapper.mapException(e);
    }
  }
}
