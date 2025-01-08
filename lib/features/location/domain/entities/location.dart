import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final String id;
  final String name;
  final String type;
  final String dimension;
  final List<String> residentIds;
  final String created;

  const Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residentIds,
    required this.created,
  });

  @override
  List<Object?> get props => [id, name, type, dimension, residentIds, created];
}
