import 'package:dartz/dartz.dart';
import 'package:seektest/core/error/failures.dart';
import '../entities/location.dart';

abstract class LocationRepository {
  Future<Either<Failure, List<Location>>> getLocations({
    required int page,
    String? nameFilter,
    String? type,
  });
}
