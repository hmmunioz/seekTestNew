import '../../domain/entities/character.dart';

class CharacterModel extends Character {
  const CharacterModel({
    required super.id,
    required super.name,
    required super.status,
    required super.species,
    required super.gender,
    required super.image,
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      species: json['species'] as String,
      gender: json['gender'] as String,
      image: json['image'] as String,
    );
  }

  static List<Character> toEntityList(List<CharacterModel> models) {
    return models
        .map((model) => Character(
              id: model.id,
              name: model.name,
              status: model.status,
              species: model.species,
              gender: model.gender,
              image: model.image,
            ))
        .toList();
  }
}
