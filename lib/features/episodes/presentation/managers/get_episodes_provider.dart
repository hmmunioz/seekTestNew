import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/features/episodes/domain/repositories/episode_repository_provider.dart';
import 'package:seektest/features/episodes/domain/usecases/get_episodes.dart';

final getEpisodesUseCaseProvider = Provider<GetEpisodes>((ref) {
  final repository = ref.read(episodeRepositoryProvider);
  return GetEpisodes(repository);
});
