import 'package:seektest/features/location/domain/entities/location.dart';

class LocationModel extends Location {
  const LocationModel({
    required super.id,
    required super.name,
    required super.type,
    required super.dimension,
    required super.residentIds,
    required super.created,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      dimension: json['dimension'] as String,
      residentIds: List<String>.from(
        (json['residents'] as List<dynamic>).map((resident) => resident['id'] as String),
      ),
      created: json['created'] as String,
    );
  }

  static List<Location> toEntityList(List<LocationModel> models) {
    return models
        .map((model) => Location(
              id: model.id,
              name: model.name,
              type: model.type,
              dimension: model.dimension,
              residentIds: model.residentIds,
              created: model.created,
            ))
        .toList();
  }
}
