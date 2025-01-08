import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/network/graphql_client.dart';
import 'package:seektest/features/location/data/datasources/location_datasource.dart';
import 'package:seektest/features/location/data/datasources/location_datasource_impl.dart';
import 'package:seektest/features/location/domain/repositories/location_repository.dart';
import 'package:seektest/features/location/domain/repositories/location_repository_imp.dart';

final locationDatasourceProvider = Provider<LocationDatasource>((ref) {
  final client = ref.read(graphQLClientWrapperProvider);
  return LocationDatasourceImpl(client);
});

final locationRepositoryProvider = Provider<LocationRepository>((ref) {
  final datasource = ref.read(locationDatasourceProvider);

  return LocationRepositoryImpl(datasource: datasource);
});
