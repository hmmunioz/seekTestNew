import 'package:go_router/go_router.dart';
import 'package:seektest/features/characters/presentation/pages/characters/characters_page.dart';
import 'package:seektest/features/episodes/presentation/pages/episodes/episodes_page.dart';
import 'package:seektest/features/home/presentation/pages/home_page.dart';
import 'package:seektest/features/location/presentation/pages/locations/locations_page.dart';
import 'package:seektest/features/welcome/presentation/pages/welcome_page.dart';
import 'app_routes.dart';

final appRouter = GoRouter(
  initialLocation: AppRoutes.welcome,
  routes: [
    GoRoute(
      path: AppRoutes.welcome,
      name: 'welcome_page',
      builder: (context, state) => const WelcomePage(),
    ),
    ShellRoute(
      builder: (context, state, child) => HomePage(child: child),
      routes: [
        GoRoute(
          path: AppRoutes.characters,
          name: 'characters_page',
          builder: (context, state) => const CharactersPage(),
        ),
        GoRoute(
          path: AppRoutes.locations,
          name: 'locations_page',
          builder: (context, state) => const LocationsPage(),
        ),
        GoRoute(
          path: AppRoutes.episodes,
          name: 'episodes_page',
          builder: (context, state) => const EpisodesPage(),
        ),
      ],
    ),
  ],
);
