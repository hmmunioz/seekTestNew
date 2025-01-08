import 'package:dartz/dartz.dart';
import 'package:seektest/core/error/failures.dart';
import 'package:seektest/core/error/logger.dart';
import 'package:seektest/core/usecases/usecase.dart';
import 'package:seektest/features/characters/domain/repositories/character_repository.dart';
import 'package:seektest/features/characters/domain/entities/character.dart';

class GetCharacters extends UseCase<List<Character>, GetCharactersParams> {
  final CharacterRepository repository;

  GetCharacters(this.repository);

  @override
  Future<Either<Failure, List<Character>>> call(GetCharactersParams params) async {
    try {
      return await repository.getCharacters(
        page: params.page,
        nameFilter: params.nameFilter,
        status: params.status,
      );
    } catch (e, stackTrace) {
      Logger.logError('UseCase error: $e', stackTrace: stackTrace);
      return Left(ServerFailure('Failed to execute use case'));
    }
  }
}

class GetCharactersParams {
  final int page;
  final String? nameFilter;
  final String? status;

  const GetCharactersParams({
    required this.page,
    this.nameFilter,
    this.status,
  });
}
