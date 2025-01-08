import 'package:equatable/equatable.dart';

class Episode extends Equatable {
  final String id;
  final String name;
  final String airDate;
  final String episodeCode;
  final List<String> characterIds;

  const Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episodeCode,
    required this.characterIds,
  });

  @override
  List<Object?> get props => [id, name, airDate, episodeCode, characterIds];
}
