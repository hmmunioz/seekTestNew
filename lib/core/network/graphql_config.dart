import 'package:graphql/client.dart';

class GraphQLConfig {
  static GraphQLClient initClient() {
    final HttpLink httpLink = HttpLink('https://rickandmortyapi.com/graphql');

    return GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }
}
