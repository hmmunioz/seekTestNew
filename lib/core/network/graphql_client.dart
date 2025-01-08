import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';
import 'graphql_config.dart';

final graphQLClientProvider = Provider<GraphQLClient>((ref) {
  return GraphQLConfig.initClient();
});

final graphQLClientWrapperProvider = Provider<GraphQLClientWrapper>((ref) {
  final client = ref.read(graphQLClientProvider);
  return GraphQLClientWrapper(client);
});

class GraphQLClientWrapper {
  final GraphQLClient _client;

  GraphQLClientWrapper(this._client);

  Future<QueryResult> query(String query, {Map<String, dynamic>? variables}) async {
    final options = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );

    return await _client.query(options);
  }
}
