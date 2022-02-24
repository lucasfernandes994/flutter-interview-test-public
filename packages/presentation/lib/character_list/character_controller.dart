import 'package:core/base/view_state.dart';
import 'package:domain/entities/character.dart';
import 'package:domain/use_cases/get_all_characters_use_case.dart';

class CharacterController {
  final GetAllCharactersUseCase _getAllCharacters;

  CharacterController(this._getAllCharacters);

  Future<ViewState> getCharacters(int page) async {
    final result = await _getAllCharacters(page);

    if (result.isSuccess) {
      if (result.data?.results!.isEmpty == true) {
        return EmptyState();
      } else {
        return DataState<List<Character>>(result.data?.results ?? []);
      }
    } else {
      return ErrorState(message: result.error?.toString() ?? '');
    }
  }
}
