import 'dart:html';
import 'package:base_bloc_3/base/network/errors/error.dart';
import 'package:dartz/dartz.dart';
import '../entity/index.dart';

abstract class WeatherRepository {
  Future<Either<BaseError, List<AreaEntity>>> getArea({
    required int offset,
    required int limit,
  });
  Future<Either<BaseError, List<CityEntity>>> getCity({
    required int offset,
  });
}
