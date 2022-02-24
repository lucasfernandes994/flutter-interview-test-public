import 'package:core/base/api_response.dart';
import 'package:core/base/view_state.dart';
import 'package:domain/entities/character.dart';
import 'package:domain/entities/paged_result.dart';
import 'package:domain/use_cases/get_all_characters_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/character_list/character_controller.dart';

class MockGetAllCharactersUseCase extends Mock implements GetAllCharactersUseCase {}

class FakeResultWithResult extends Fake implements ApiResponse<PagedResult<Character>> {
  @override
  bool get isSuccess => true;

  @override
  PagedResult<Character>? get data => PagedResult(results: [Character()]);
}

class FakeResultWithOutResult extends Fake implements ApiResponse<PagedResult<Character>> {
  @override
  bool get isSuccess => true;

  @override
  PagedResult<Character>? get data => PagedResult(results: []);
}

class FakeResultWithFailure extends Fake implements ApiResponse<PagedResult<Character>> {
  @override
  bool get isSuccess => false;

  @override
  Exception? get error => Exception('error');
}

void main() {
  late GetAllCharactersUseCase useCase;

  late CharacterController controller;

  setUp(() {
    useCase = MockGetAllCharactersUseCase();
    controller = CharacterController(useCase);
  });

  test(
    'should get DataState when call use case',
    () async {
      final page = 0;
      final response = FakeResultWithResult();

      when(() => useCase(page)).thenAnswer((_) async => response);

      final result = await controller.getCharacters(page);

      expect(result is DataState<List<Character>>, true);

      verify(() => useCase(page)).called(1);
    },
  );

  test(
    'should get EmptyState when call use case',
    () async {
      final page = 0;
      final response = FakeResultWithOutResult();

      when(() => useCase(page)).thenAnswer((_) async => response);

      final result = await controller.getCharacters(page);

      expect(result is EmptyState, true);

      verify(() => useCase(page)).called(1);
    },
  );

  test(
    'should get ErrorState when call use case',
    () async {
      final page = 0;
      final response = FakeResultWithFailure();

      when(() => useCase(page)).thenAnswer((_) async => response);

      final result = await controller.getCharacters(page);

      expect(result is ErrorState, true);

      verify(() => useCase(page)).called(1);
    },
  );
}
