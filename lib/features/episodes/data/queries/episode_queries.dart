const String fetchEpisodesQuery = r'''
  query Episodes($page: Int, $name: String) {
    episodes(page: $page, filter: { name: $name }) {
      results {
        id
        name
        air_date
        episode
        characters {
          id
        }
      }
    }
  }
''';
