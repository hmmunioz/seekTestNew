import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/features/characters/domain/repositories/character_repository_provider.dart';

import 'package:seektest/features/characters/domain/usecases/get_caracters.dart';

final getCharactersUseCaseProvider = Provider<GetCharacters>((ref) {
  final repository = ref.read(characterRepositoryProvider);
  return GetCharacters(repository);
});
