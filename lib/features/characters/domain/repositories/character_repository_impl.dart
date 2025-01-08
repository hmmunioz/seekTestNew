import 'package:dartz/dartz.dart';
import 'package:seektest/core/error/failures.dart';
import 'package:seektest/core/error/error_handler.dart';
import 'package:seektest/core/error/logger.dart';
import 'package:seektest/features/characters/data/datasources/character_datasource.dart';
import 'package:seektest/features/characters/domain/repositories/character_repository.dart';
import '../entities/character.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource datasource;

  CharacterRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<Character>>> getCharacters({
    required int page,
    String? nameFilter,
  }) async {
    try {
      final characters = await datasource.fetchCharacters(page: page, nameFilter: nameFilter);

      return Right(characters);
    } catch (e, stackTrace) {
      Logger.logError('Repository error: $e', stackTrace: stackTrace);
      return Left(ErrorHandler.handle(e as Exception, stackTrace: stackTrace));
    }
  }
}
