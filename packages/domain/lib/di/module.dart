import 'package:domain/repositories/character_repository.dart';
import 'package:domain/use_cases/get_all_characters_use_case.dart';
import 'package:get_it/get_it.dart';

class DomainModule {
  static void setup(GetIt locator) {
    locator.registerFactory<GetAllCharactersUseCase>(
      () => GetAllCharactersUseCase(
        repository: locator.get<CharacterRepository>(),
      ),
    );
  }
}
