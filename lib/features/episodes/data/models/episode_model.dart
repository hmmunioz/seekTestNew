import '../../domain/entities/episode.dart';

class EpisodeModel extends Episode {
  const EpisodeModel({
    required super.id,
    required super.name,
    required super.airDate,
    required super.episodeCode,
    required super.characterIds,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'] as String,
      name: json['name'] as String,
      airDate: json['air_date'] as String,
      episodeCode: json['episode'] as String,
      characterIds: List<String>.from(
        (json['characters'] as List<dynamic>).map((character) => character['id'] as String),
      ),
    );
  }

  static List<Episode> toEntityList(List<EpisodeModel> models) {
    return models
        .map((model) => Episode(
              id: model.id,
              name: model.name,
              airDate: model.airDate,
              episodeCode: model.episodeCode,
              characterIds: model.characterIds,
            ))
        .toList();
  }
}
