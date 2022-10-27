import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:base_bloc_3/features/start/domain/entity/movie_entity.dart';
import 'package:dartz/dartz.dart';

abstract class StartUseCase {
  Future<Either<BaseError, List<MovieEntity>>> getMovie({required int index});
}
