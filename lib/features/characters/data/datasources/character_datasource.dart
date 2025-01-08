import 'package:seektest/features/characters/data/models/character_model.dart';

abstract class CharacterDatasource {
  Future<List<CharacterModel>> fetchCharacters({int page, String? nameFilter, String? status});
}
