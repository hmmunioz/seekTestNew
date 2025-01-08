import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/constants/app_strings.dart';
import 'package:seektest/features/location/presentation/managers/locations_provider.dart';
import 'package:seektest/features/location/presentation/pages/widgets/locations_list.dart';
import 'package:seektest/shared/widgets/atoms/error_widget_custom.dart';
import 'package:seektest/shared/widgets/atoms/loading_widget.dart';
import 'package:seektest/shared/widgets/atoms/search_custom_bar.dart';
import 'package:seektest/shared/widgets/templates/page_template.dart';

class LocationsPage extends ConsumerStatefulWidget {
  const LocationsPage({super.key});

  @override
  ConsumerState<LocationsPage> createState() => _LocationsPageState();
}

class _LocationsPageState extends ConsumerState<LocationsPage> {
  @override
  void initState() {
    super.initState();
    ref.read(locationsProvider.notifier).fetchLocations(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    final locationsState = ref.watch(locationsProvider);

    return PageTemplate(
      title: AppStrings.locationsTab(context),
      body: Column(
        children: [
          SearchBarCustom(
            hintText: '${AppStrings.search(context)} ${AppStrings.locationCards(context)}...',
            onSearchChanged: (query) {
              if (query.isNotEmpty) {
                ref.read(locationsProvider.notifier).fetchLocations(
                      page: 1,
                      name: query,
                    );
              } else if (query.isEmpty) {
                ref.read(locationsProvider.notifier).fetchLocations();
              }
            },
          ),
          Expanded(
            child: locationsState.when(
              data: (locations) => LocationsList(),
              loading: () => const LoadingWidget(),
              error: (error, _) => ErrorWidgetCustom(
                message: '${AppStrings.unexpectedError(context)} $error',
                onRetry: () {
                  ref.read(locationsProvider.notifier).fetchLocations();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
