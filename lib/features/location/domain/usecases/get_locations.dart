import 'package:dartz/dartz.dart';
import 'package:seektest/core/error/failures.dart';
import 'package:seektest/core/error/logger.dart';
import 'package:seektest/features/location/domain/entities/location.dart';
import 'package:seektest/features/location/domain/repositories/location_repository.dart';

class GetLocations {
  final LocationRepository repository;

  GetLocations(this.repository);

  Future<Either<Failure, List<Location>>> call(GetLocationsParams params) async {
    try {
      return await repository.getLocations(
        page: params.page,
        nameFilter: params.name,
        type: params.type,
      );
    } catch (e, stackTrace) {
      Logger.logError('UseCase error: $e', stackTrace: stackTrace);
      return Left(ServerFailure('Failed to execute use case'));
    }
  }
}

class GetLocationsParams {
  final int page;
  final String? name;
  final String? type;

  const GetLocationsParams({
    required this.page,
    this.name,
    this.type,
  });
}
