import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/core/error/logger.dart';
import 'package:seektest/features/location/domain/entities/location.dart';
import 'package:seektest/features/location/domain/usecases/get_locations.dart';
import 'package:seektest/features/location/presentation/managers/get_locations_provider.dart';

final locationsProvider = StateNotifierProvider<LocationsNotifier, AsyncValue<List<Location>>>((ref) {
  final getLocations = ref.read(getLocationsUseCaseProvider);
  return LocationsNotifier(getLocations);
});

class LocationsNotifier extends StateNotifier<AsyncValue<List<Location>>> {
  final GetLocations getLocations;
  int _currentPage = 1;
  bool _hasMore = true;
  bool _isLoadingMore = false;

  String? _currentNameFilter;
  String? _currentNameType;

  bool get hasMore => _hasMore;
  bool get isLoadingMore => _isLoadingMore;

  LocationsNotifier(this.getLocations) : super(const AsyncValue.loading());

  Future<void> fetchLocations({
    int page = 1,
    String? name,
    String? type,
  }) async {
    try {
      if (name != null && name.isNotEmpty || type != null) {
        _currentPage = 1;
        _hasMore = true;
        _currentNameFilter = name;
        _currentNameType = type;
      }

      final result = await getLocations(GetLocationsParams(
        page: page,
        name: _currentNameFilter,
        type: _currentNameType,
      ));

      result.fold(
        (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
        (locations) {
          if (page == 1) {
            state = AsyncValue.data(locations);
          } else {
            state = AsyncValue.data([...state.value ?? [], ...locations]);
          }
          _hasMore = locations.length >= 20;
        },
      );
    } catch (e, stackTrace) {
      Logger.logError('Unexpected Notifier error: $e', stackTrace: stackTrace);
      state = AsyncValue.error(e.toString(), StackTrace.current);
    }
  }

  Future<void> fetchNextPage() async {
    if (!_hasMore || _isLoadingMore) return;
    _isLoadingMore = true;

    try {
      final result = await getLocations(GetLocationsParams(
        page: _currentPage + 1,
        name: _currentNameFilter,
        type: _currentNameType,
      ));

      result.fold(
        (failure) => state = AsyncValue.error(failure.message, StackTrace.current),
        (newLocations) {
          if (newLocations.isEmpty) _hasMore = false;
          _currentPage++;
          state = AsyncValue.data([...state.value ?? [], ...newLocations]);
        },
      );
    } finally {
      _isLoadingMore = false;
    }
  }
}
