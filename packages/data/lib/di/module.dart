import 'package:data/repositories/character_repository.dart';
import 'package:domain/repositories/character_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:infra/drivers/http_driver.dart';

import '../repositories/character_mapper.dart';

class DataModule {
  static void setup(GetIt locator) {
    locator.registerFactory<CharacterMapper>(
      () => CharacterMapper(),
    );
    locator.registerFactory<CharacterRepository>(
      () => CharacterRepositoryImpl(locator.get<HttpDriver>(), locator.get<CharacterMapper>()),
    );
  }
}
