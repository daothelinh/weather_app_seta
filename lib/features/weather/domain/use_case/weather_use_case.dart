import 'package:dartz/dartz.dart';

import '../../../../base/network/errors/error.dart';
import '../entity/area_entity.dart';
import '../entity/city_entity.dart';

abstract class WeatherUseCase {
  Future<Either<BaseError, List<AreaEntity>>> getArea({
    required int offset,
    required int limit,
  });
  Future<Either<BaseError, List<CityEntity>>> getCity({
    required int offset,
    required String q,
  });
}
