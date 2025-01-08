import 'package:seektest/core/error/logger.dart';
import 'package:seektest/features/characters/data/datasources/character_datasource.dart';
import 'package:seektest/features/characters/data/queries/character_queries.dart';

import '../../../../core/network/graphql_client.dart';
import '../models/character_model.dart';

class CharacterDatasourceImpl implements CharacterDatasource {
  final GraphQLClientWrapper client;

  CharacterDatasourceImpl(this.client);

  @override
  Future<List<CharacterModel>> fetchCharacters({int page = 1, String? nameFilter}) async {
    try {
      final result = await client.query(fetchCharactersQuery, variables: {
        'page': page,
        'name': nameFilter,
      });

      if (result.hasException) {
        Logger.logError('GraphQL Exception: ${result.exception}');
        throw Exception(result.exception.toString());
      }

      final data = result.data?['characters']['results'] as List<dynamic>;
      return data.map((e) => CharacterModel.fromJson(e)).toList();
    } catch (e, stackTrace) {
      Logger.logError('Datasource error: $e', stackTrace: stackTrace);
      throw Exception('Failed to fetch data');
    }
  }
}
