const String fetchCharactersQuery = r'''
  query Characters($page: Int, $name: String, $status: String) {
    characters(page: $page, filter: { name: $name, status: $status }) {
      results {
        id
        name
        status
        species
        gender
        image
      }
    }
  }
''';
