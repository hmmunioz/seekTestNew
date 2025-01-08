import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:seektest/core/constants/app_strings.dart';
import 'package:seektest/shared/widgets/organisms/app_bottom_navigation_bar.dart';
import 'package:seektest/shared/widgets/organisms/app_custom_bar.dart';
import 'package:seektest/shared/widgets/templates/app_templates.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouter.of(context).state?.name ?? '/';

    int getCurrentIndex() {
      switch (currentRoute) {
        case '/characters_page':
          return 0;
        case 'locations_page':
          return 1;
        case 'episodes_page':
          return 2;
        default:
          return 0;
      }
    }

    return AppTemplate(
      appBar: AppCustomAppBar(
        title: AppStrings.homeTitle(context),
      ),
      body: child,
      bottomNavigationBar: AppBottomNavigationBar(
        currentIndex: getCurrentIndex(),
        onTap: (index) {
          switch (index) {
            case 0:
              context.goNamed('characters_page');
              break;
            case 1:
              context.goNamed('locations_page');
              break;
            case 2:
              context.goNamed('episodes_page');
              break;
          }
        },
      ),
    );
  }
}
