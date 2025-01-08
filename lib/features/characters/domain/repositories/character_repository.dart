import 'package:dartz/dartz.dart';
import 'package:seektest/core/error/failures.dart';
import 'package:seektest/features/characters/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Failure, List<Character>>> getCharacters({
    required int page,
    String? nameFilter,
  });
}
