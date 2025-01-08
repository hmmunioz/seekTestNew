import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/constants/app_strings.dart';
import 'package:seektest/features/location/domain/entities/location.dart';
import 'package:seektest/features/location/presentation/managers/locations_provider.dart';
import 'package:seektest/shared/widgets/atoms/error_widget_custom.dart';
import 'package:seektest/shared/widgets/atoms/loading_widget.dart';
import 'package:seektest/shared/widgets/molecules/text_info_card.dart';
import 'package:seektest/shared/widgets/organisms/infinite_scroll_list.dart';

class LocationsList extends ConsumerStatefulWidget {
  const LocationsList({super.key});

  @override
  ConsumerState<LocationsList> createState() => _LocationsListState();
}

class _LocationsListState extends ConsumerState<LocationsList> {
  late final locationsProviderNotifier = ref.read(locationsProvider.notifier);

  @override
  Widget build(BuildContext context) {
    final locationsState = ref.watch(locationsProvider);

    return locationsState.when(
      data: (locations) {
        return InfiniteScrollList<Location>(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            final location = locations[index];
            return TextInfoCard(
              title: location.name,
              subtitleLeft: location.type,
              subtitleRight: location.dimension,
              additionalInfo: '${location.residentIds.length} ${AppStrings.residents(context)}',
              icon: Icons.location_city,
            );
          },
          onFetchMore: () => locationsProviderNotifier.fetchNextPage(),
          isLoadingMore: locationsProviderNotifier.isLoadingMore,
          hasMore: locationsProviderNotifier.hasMore,
        );
      },
      loading: () => const LoadingWidget(),
      error: (error, _) => ErrorWidgetCustom(
        message: '${AppStrings.unexpectedError(context)} $error',
        onRetry: () {
          ref.read(locationsProvider.notifier).fetchLocations();
        },
      ),
    );
  }
}
