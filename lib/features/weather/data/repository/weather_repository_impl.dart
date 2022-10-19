import 'package:dartz/dartz.dart';

import 'package:base_bloc_3/features/weather/domain/entity/city_entity.dart';

import 'package:base_bloc_3/features/weather/domain/entity/area_entity.dart';

import 'package:base_bloc_3/base/network/errors/error.dart';

import '../../domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  @override
  Future<Either<BaseError, List<AreaEntity>>> getArea(
      {required int offset, required int limit}) {
    // TODO: implement getArea
    throw UnimplementedError();
  }

  @override
  Future<Either<BaseError, List<CityEntity>>> getCity({required int offset}) {
    // TODO: implement getCity
    throw UnimplementedError();
  }
}
