const String fetchLocationsQuery = r'''
  query Locations($page: Int, $name: String, $type: String) {
    locations(page: $page, filter: { name: $name, type: $type }) {
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
