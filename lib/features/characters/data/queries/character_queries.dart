const String fetchCharactersQuery = r'''
  query Characters($page: Int, $name: String) {
    characters(page: $page, filter: { name: $name }) {
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
