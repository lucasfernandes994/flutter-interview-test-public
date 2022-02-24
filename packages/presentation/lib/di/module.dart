import 'package:domain/use_cases/get_all_characters_use_case.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation/character_list/character_controller.dart';
import 'package:presentation/character_list/character_list_view.dart';

class PresentationModule {
  static void setup(GetIt locator) {
    locator.registerFactory<CharacterController>(() => CharacterController(locator.get<GetAllCharactersUseCase>()));
    locator.registerFactory<CharacterListView>(() => CharacterListView(locator.get<CharacterController>()));
  }
}
