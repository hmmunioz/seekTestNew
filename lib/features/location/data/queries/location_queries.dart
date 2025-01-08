const String fetchLocationsQuery = r'''
  query Locations($page: Int, $name: String) {
    locations(page: $page, filter: { name: $name }) {
      results {
        id
        name
        type
        dimension
        residents {
          id
        }
        created
      }
    }
  }
''';
