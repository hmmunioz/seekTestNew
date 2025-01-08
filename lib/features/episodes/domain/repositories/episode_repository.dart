import 'package:dartz/dartz.dart';
import 'package:seektest/core/error/failures.dart';
import '../../domain/entities/episode.dart';

abstract class EpisodeRepository {
  Future<Either<Failure, List<Episode>>> getEpisodes({
    required int page,
    String? nameFilter,
  });
}
