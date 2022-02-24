import 'package:core/base/api_response.dart';
import 'package:domain/entities/character.dart';
import 'package:domain/entities/paged_result.dart';
import 'package:domain/repositories/character_repository.dart';
import 'package:domain/use_cases/get_all_characters_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCharacterRepository extends Mock implements CharacterRepository {}

class FakeResult extends Fake implements ApiResponse<PagedResult<Character>> {}

void main() {
  late MockCharacterRepository repository;

  late GetAllCharactersUseCase useCase;

  setUp(() {
    repository = MockCharacterRepository();
    useCase = GetAllCharactersUseCase(repository: repository);
  });

  test(
    'should get all character form repository with success',
    () async {
      final page = 0;
      final response = FakeResult();

      when(() => repository.getAll(page)).thenAnswer((_) async => response);

      final result = await useCase(page);

      expect(result, response);

      verify(() => repository.getAll(page)).called(1);
    },
  );
}
