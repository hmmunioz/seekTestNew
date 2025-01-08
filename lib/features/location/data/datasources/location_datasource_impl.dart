import 'package:seektest/core/error/logger.dart';
import 'package:seektest/core/network/graphql_client.dart';
import 'package:seektest/features/location/data/datasources/location_datasource.dart';
import 'package:seektest/features/location/data/models/location_model.dart';
import 'package:seektest/features/location/data/queries/location_queries.dart';

class LocationDatasourceImpl implements LocationDatasource {
  final GraphQLClientWrapper client;

  LocationDatasourceImpl(this.client);

  @override
  Future<List<LocationModel>> fetchLocations({
    int page = 1,
    String? name,
    String? type,
  }) async {
    try {
      final result = await client.query(fetchLocationsQuery, variables: {
        'page': page,
        'name': name,
        'type': type,
      });

      if (result.hasException) {
        Logger.logError('GraphQL Exception: ${result.exception}');
        throw Exception(result.exception.toString());
      }

      final data = result.data?['locations']['results'] as List<dynamic>;
      return data.map((e) => LocationModel.fromJson(e)).toList();
    } catch (e, stackTrace) {
      Logger.logError('Datasource error: $e', stackTrace: stackTrace);
      throw Exception('Failed to fetch data');
    }
  }
}
