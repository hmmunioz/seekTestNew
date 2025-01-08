import 'package:dartz/dartz.dart';
import 'package:seektest/core/error/failures.dart';
import 'package:seektest/core/error/error_handler.dart';
import 'package:seektest/core/error/logger.dart';
import 'package:seektest/features/location/data/datasources/location_datasource.dart';
import 'package:seektest/features/location/domain/entities/location.dart';
import 'package:seektest/features/location/domain/repositories/location_repository.dart';

class LocationRepositoryImpl implements LocationRepository {
  final LocationDatasource datasource;

  LocationRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<Location>>> getLocations({
    required int page,
    String? nameFilter,
    String? type,
  }) async {
    try {
      final locations = await datasource.fetchLocations(
        page: page,
        name: nameFilter,
        type: type,
      );

      return Right(locations);
    } catch (e, stackTrace) {
      Logger.logError('Repository error: $e', stackTrace: stackTrace);
      return Left(ErrorHandler.handle(e as Exception, stackTrace: stackTrace));
    }
  }
}
