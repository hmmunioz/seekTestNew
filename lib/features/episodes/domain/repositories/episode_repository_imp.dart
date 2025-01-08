import 'package:dartz/dartz.dart';
import 'package:seektest/core/error/failures.dart';
import 'package:seektest/core/error/error_handler.dart';
import 'package:seektest/core/error/logger.dart';
import 'package:seektest/features/episodes/data/datasources/episode_datasource.dart';
import 'package:seektest/features/episodes/domain/entities/episode.dart';
import 'package:seektest/features/episodes/domain/repositories/episode_repository.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final EpisodeDatasource datasource;

  EpisodeRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<Episode>>> getEpisodes({
    required int page,
    String? nameFilter,
  }) async {
    try {
      final episodes = await datasource.fetchEpisodes(page: page, name: nameFilter);

      return Right(episodes);
    } catch (e, stackTrace) {
      Logger.logError('Repository error: $e', stackTrace: stackTrace);
      return Left(ErrorHandler.handle(e as Exception, stackTrace: stackTrace));
    }
  }
}
