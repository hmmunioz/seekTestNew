import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/network/graphql_client.dart';
import 'package:seektest/features/episodes/data/datasources/episode_datasource.dart';
import 'package:seektest/features/episodes/data/datasources/episode_datasource_impl.dart';
import 'package:seektest/features/episodes/domain/repositories/episode_repository.dart';
import 'package:seektest/features/episodes/domain/repositories/episode_repository_imp.dart';

final episodeDatasourceProvider = Provider<EpisodeDatasource>((ref) {
  final client = ref.read(graphQLClientWrapperProvider);
  return EpisodeDatasourceImpl(client);
});

final episodeRepositoryProvider = Provider<EpisodeRepository>((ref) {
  final datasource = ref.read(episodeDatasourceProvider);

  return EpisodeRepositoryImpl(datasource: datasource);
});
