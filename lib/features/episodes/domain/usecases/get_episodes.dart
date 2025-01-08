import 'package:dartz/dartz.dart';
import 'package:seektest/core/error/failures.dart';
import 'package:seektest/core/error/logger.dart';
import 'package:seektest/features/episodes/domain/entities/episode.dart';
import 'package:seektest/features/episodes/domain/repositories/episode_repository.dart';

class GetEpisodes {
  final EpisodeRepository repository;

  GetEpisodes(this.repository);

  Future<Either<Failure, List<Episode>>> call(GetEpisodesParams params) async {
    try {
      return await repository.getEpisodes(
        page: params.page,
        nameFilter: params.name,
      );
    } catch (e, stackTrace) {
      Logger.logError('UseCase error: $e', stackTrace: stackTrace);
      return Left(ServerFailure('Failed to execute use case'));
    }
  }
}

class GetEpisodesParams {
  final int page;
  final String? name;

  const GetEpisodesParams({
    required this.page,
    this.name,
  });
}
