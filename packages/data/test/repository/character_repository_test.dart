import 'package:core/base/api_response.dart';
import 'package:core/resources/endpoints.dart';
import 'package:data/models/character_model.dart';
import 'package:data/models/page_result_model.dart';
import 'package:data/repositories/character_mapper.dart';
import 'package:data/repositories/character_repository.dart';
import 'package:domain/entities/character.dart';
import 'package:domain/entities/paged_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:infra/drivers/http_driver.dart';
import 'package:infra/drivers/http_driver_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockHttpDriver extends Mock implements HttpDriver {}

class MockCharacterMapper extends Mock implements CharacterMapper {}

class FakePagedResultModel extends Fake implements PagedResultModel<CharacterModel> {}

class FakePagedResult extends Fake implements PagedResult<Character> {}

void main() {
  late HttpDriver httpDriver;

  late CharacterMapper mapper;
  late CharacterRepositoryImpl repository;

  setUp(() {
    mapper = MockCharacterMapper();
    httpDriver = MockHttpDriver();
    repository = CharacterRepositoryImpl(httpDriver, mapper);
  });

  test('should get all characters with success from networking', () async {
    const page = 20;
    final response = FakePagedResultModel();
    final fakeResult = FakePagedResult();
    final apiResponse = ApiResponse<PagedResult<Character>>.success(fakeResult);

    when(() => httpDriver.request<PagedResultModel<CharacterModel>>(
          baseUrl: Endpoints.baseUrl,
          method: HttpMethod.GET,
          endpoint: Endpoints.character,
          queryParams: {'page': page},
          mapper: (dynamic json) => PagedResultModel.fromJson<CharacterModel>(json, CharacterModel.fromJson),
        )).thenAnswer((_) async => response);

    when(() => mapper.mapPagedResultModel(response)).thenReturn(apiResponse);

    final result = await repository.getAll(page);

    expect(result, apiResponse);

    verify(() => httpDriver.request<PagedResultModel<CharacterModel>>(
          baseUrl: Endpoints.baseUrl,
          method: HttpMethod.GET,
          endpoint: Endpoints.character,
          queryParams: {'page': page},
          mapper: (dynamic json) => PagedResultModel.fromJson<CharacterModel>(json, CharacterModel.fromJson),
        )).called(1);
  });
}
