import 'package:core/base/api_response.dart';
import 'package:data/models/location_model.dart';
import 'package:data/models/page_result_model.dart';
import 'package:data/models/result_information_model.dart';
import 'package:domain/entities/character.dart';
import 'package:domain/entities/location.dart';
import 'package:domain/entities/paged_result.dart';
import 'package:domain/entities/result_information.dart';

import '../models/character_model.dart';

class CharacterMapper {
  ApiResponse<PagedResult<Character>> mapPagedResultModel(PagedResultModel<CharacterModel> model) {
    return ApiResponse<PagedResult<Character>>.success(_mapToPageResult(model));
  }

  ApiResponse<PagedResult<Character>> mapException(Exception? exception) {
    return ApiResponse.error(exception);
  }

  PagedResult<Character> _mapToPageResult(PagedResultModel model) {
    return PagedResult(
        results: model.results?.map((e) => _mapToCharacter(e)).toList(),
        information: _mapToResultInformation(model.information));
  }

  Character _mapToCharacter(CharacterModel? model) {
    return Character(
      id: model?.id,
      name: model?.name,
      status: model?.status,
      species: model?.species,
      type: model?.type,
      gender: model?.gender,
      location: _mapToLocation(model?.location),
      origin: _mapToLocation(model?.origin),
      imageUrl: model?.imageUrl,
      episodesUrl: model?.episodesUrl,
      characterUrl: model?.characterUrl,
      created: model?.created,
    );
  }

  Location _mapToLocation(LocationModel? model) {
    return Location(
      id: model?.id,
      name: model?.name,
      type: model?.type,
      dimension: model?.dimension,
      residentsUrl: model?.residentsUrl,
      locationUrl: model?.locationUrl,
    );
  }

  ResultInformation _mapToResultInformation(ResultInformationModel? model) {
    return ResultInformation(
      count: model?.count,
      pages: model?.pages,
      nextUrl: model?.nextUrl,
      prevUrl: model?.prevUrl,
    );
  }
}
