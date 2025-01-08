import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:seektest/features/location/domain/repositories/location_repository_provider.dart';
import 'package:seektest/features/location/domain/usecases/get_locations.dart';

final getLocationsUseCaseProvider = Provider<GetLocations>((ref) {
  final repository = ref.read(locationRepositoryProvider);
  return GetLocations(repository);
});
