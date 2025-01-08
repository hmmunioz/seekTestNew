import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/features/characters/data/datasources/character_datasource.dart';
import 'package:seektest/features/characters/domain/repositories/character_repository.dart';
import 'character_repository_impl.dart';
import '../../data/datasources/character_datasource_impl.dart';
import '../../../../core/network/graphql_client.dart';

final characterDatasourceProvider = Provider<CharacterDatasource>((ref) {
  final client = ref.read(graphQLClientWrapperProvider);
  return CharacterDatasourceImpl(client);
});

final characterRepositoryProvider = Provider<CharacterRepository>((ref) {
  final datasource = ref.read(characterDatasourceProvider);

  return CharacterRepositoryImpl(datasource: datasource);
});
