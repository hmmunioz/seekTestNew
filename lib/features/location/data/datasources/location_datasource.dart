import 'package:seektest/features/location/data/models/location_model.dart';

abstract class LocationDatasource {
  Future<List<LocationModel>> fetchLocations(
    int page, {
    String? name,
  });
}
