import 'package:core/base/api_response.dart';
import 'package:core/base/use_case.dart';
import 'package:domain/entities/character.dart';
import 'package:domain/entities/paged_result.dart';
import 'package:domain/repositories/character_repository.dart';

class GetAllCharactersUseCase implements UseCase<PagedResult<Character>, int> {
  final CharacterRepository repository;

  GetAllCharactersUseCase({required this.repository});

  @override
  Future<ApiResponse<PagedResult<Character>>> call(int page) async => repository.getAll(page);
}
