import 'package:seektest/features/episodes/data/models/episode_model.dart';

abstract class EpisodeDatasource {
  Future<List<EpisodeModel>> fetchEpisodes({int page, String? name});
}
