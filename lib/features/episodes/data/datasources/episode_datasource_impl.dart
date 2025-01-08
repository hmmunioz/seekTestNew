import 'package:seektest/core/error/logger.dart';
import 'package:seektest/core/network/graphql_client.dart';
import 'package:seektest/features/episodes/data/datasources/episode_datasource.dart';
import 'package:seektest/features/episodes/data/queries/episode_queries.dart';

import '../models/episode_model.dart';

class EpisodeDatasourceImpl implements EpisodeDatasource {
  final GraphQLClientWrapper client;

  EpisodeDatasourceImpl(this.client);

  @override
  Future<List<EpisodeModel>> fetchEpisodes({int page = 1, String? name}) async {
    try {
      final variables = {
        'page': page,
        'name': name,
      };

      final result = await client.query(fetchEpisodesQuery, variables: variables);

      if (result.hasException) {
        Logger.logError('GraphQL Exception: ${result.exception}');
        throw Exception(result.exception.toString());
      }

      final data = result.data?['episodes']['results'] as List<dynamic>;
      return data.map((e) => EpisodeModel.fromJson(e)).toList();
    } catch (e, stackTrace) {
      Logger.logError('Datasource error: $e', stackTrace: stackTrace);
      throw Exception('Failed to fetch data');
    }
  }
}
